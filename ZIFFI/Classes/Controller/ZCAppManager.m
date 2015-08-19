//
//  ZCAppManager.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCAppManager.h"
#import "ZCNetworkManager.h"
#import "ZCSearchResultModel.h"
#import "ZCHomeViewController.h"
#import "ZCLoadMoreCellView.h"
#import "ZCHelper.h"

@interface ZCAppManager () <ZCSearchViewControllerDataSource>
@property (nonatomic, strong) NSDictionary *searchParams;
@property (nonatomic, strong) NSNumber *page;
@property (nonatomic, strong) ZCSearchResultModel *searchResult;
@property (nonatomic, assign) ZCDataFetchStatus fetchStatus;
@property (nonatomic, assign) ZCDataPersistenceStatus persistenceStatus;
@end

@implementation ZCAppManager

+ (instancetype) sharedAppManager{
    return SHARED_INSTANCE([[self alloc] init]);
}

- (id) init {
    if ( (self = [super init]) ) {
        // Initialization code here.
        self.searchParams = nil;
        self.page = @0;
        self.fetchStatus = ZCDataFetchStatusUnknown;
        self.persistenceStatus = ZCDataPersistenceStatusUnknown;
//  @{@"vertical" : @"salons-spas", @"city_id" : @"4", @"q" : @"Hair Spa", @"page" : @"0" };
    }
    return self;
}


- (void) searchInZiffiWithSearchParam:(NSDictionary *)searchParam withCompletionHandler:(ZCAppManagerCompletionHandler)handler{
    if (self.fetchStatus == ZCDataFetchStatusFetching) {
        return;
    }
    __weak typeof(self) weakSelf = self;
    if ([[searchParam allKeys] count] > 0) {
        self.searchParams = searchParam;
    }
    self.fetchStatus = ZCDataFetchStatusFetching;
    [[ZCNetworkManager defaultNetworkManager] POSTtoPath:SEARCH_URL_PATH withParameters:self.searchParams success:^(id response) {
        NSMutableArray *results = [NSMutableArray arrayWithArray:weakSelf.searchResult.results];
        if (!results) {
            results = [NSMutableArray array];
        }
        NSError *error = nil;
        weakSelf.searchResult = [[ZCSearchResultModel alloc] initWithDictionary:response error:&error];
        if (weakSelf.searchResult && !(weakSelf.persistenceStatus == ZCDataPersistenceStatusLoadingCompleted)) {
            weakSelf.page = [NSNumber numberWithInt:[weakSelf.searchResult.meta.page intValue] + 1];
            [results addObjectsFromArray:weakSelf.searchResult.results];
            weakSelf.searchResult.results = (NSArray<ZCSearchCategoryModel> *)[NSArray arrayWithArray:results];
        }
        weakSelf.fetchStatus = ZCDataFetchStatusCompleted;
        weakSelf.persistenceStatus = ZCDataPersistenceStatusUnknown;
        handler(@{@"status" : @"Success"});
    } failure:^(id failureMessage, NSError *error) {
        weakSelf.fetchStatus = ZCDataFetchStatusUnknown;
        weakSelf.persistenceStatus = ZCDataPersistenceStatusUnknown;
        handler(@{@"status" : @"Fail", @"error" : error.debugDescription});;
    }];
}

#pragma mark - Persistence

#define PERSISTENCE_FILE_NAME @"persistence"

- (BOOL) loadSearchDataFromPersistence{
    BOOL success = NO;
    NSDictionary *searchResults = [ZCHelper unarchiveDataFormFilePath:[[ZCHelper documentsDirectoryPath] stringByAppendingPathComponent:PERSISTENCE_FILE_NAME] andKey:NSStringFromClass([self class])];
    NSError *error = nil;
    self.searchResult = [[ZCSearchResultModel alloc] initWithDictionary:searchResults error:&error];
    if (self.searchResult) {
        success = YES;
        self.persistenceStatus = ZCDataPersistenceStatusLoadingCompleted;
    }
    return success;
}

- (BOOL) saveSearchDataToPersistence{
    BOOL success = NO;
    success = [ZCHelper archiveData:[self.searchResult toDictionary] toFilePath:[[ZCHelper documentsDirectoryPath] stringByAppendingPathComponent:PERSISTENCE_FILE_NAME] andKey:NSStringFromClass([self class])];
    if (success) {
        self.persistenceStatus = ZCDataPersistenceStatusSaveCompeleted;
    }
    else{
        self.persistenceStatus = ZCDataPersistenceStatusLoadingCompleted;
    }
    return success;
}

#pragma mark - ZCSearchViewControllerDataSource

- (id) searchViewController:(ZCHomeViewController *) searchViewController searchItemAtIndexPath:(NSIndexPath *) indexPath{
    id item = @{SEARCH_LOADING_MESSAGE : @"Loading Search Results"};
    if (self.searchResult) {
        item = [[self.searchResult results] objectAtIndex:indexPath.row];
    }
    return item;
}

- (ZCSearchCellType) searchViewController:(ZCHomeViewController *) searchViewController searchCellTypeAtIndex:(NSIndexPath *) indexPath{
    ZCSearchCellType type = ZCSearchCellTypeUnknown;
    if (self.searchResult) {
        type = ZCSearchCellTypeResult;
    }
    return type;
}

- (NSInteger) searchViewController:(ZCHomeViewController *) searchViewController numberOfRowsInSection:(NSInteger) section{
    NSInteger numberOfRows = 0;
    if (self.searchResult) {
        numberOfRows = [[self.searchResult results] count];
    }
    return numberOfRows;
}

- (NSInteger) numberOfSectionsInHomeViewController:(ZCHomeViewController *) searchViewController{
    return 1;
}

- (CGFloat) searchViewController:(ZCHomeViewController *) searchViewController heightForHeaderInSection:(NSInteger) section{
    CGFloat height = 0.0;
    if ((self.searchResult == nil || self.fetchStatus == ZCDataFetchStatusFetching)  || self.persistenceStatus == ZCDataPersistenceStatusLoadingCompleted || self.fetchStatus == ZCDataFetchStatusUnknown) {
        height = [ZCLoadMoreCellView heightForHeaderView];
    }
    
    return height;
}

- (CGFloat) searchViewController:(ZCHomeViewController *) searchViewController heightForFooterInSection:(NSInteger) section{
    CGFloat height = 0.0;
    if (!self.searchResult) {
        height = [ZCLoadMoreCellView heightForFooterView];
    }
    return height;
}

- (UIView *) searchViewController:(ZCHomeViewController *) searchViewController headerItemForSection:(NSInteger) section{
    UIView *headerView = [searchViewController.searchResultView headerViewForSection:section];
    id payload = nil;
    if (!headerView) {
        headerView = [ZCLoadMoreCellView createViewFormNib:nil];
    }
    NSString *message =  @"";
    
    if (self.searchResult && self.persistenceStatus == ZCDataPersistenceStatusLoadingCompleted) {
        message = @"Refreshing search content....";
    }
    else if (self.fetchStatus == ZCDataFetchStatusUnknown){
        message = @"Search currently facing an issue, tap to retry....";
        payload = [[ZCNetworkManager defaultNetworkManager] lastError];
    }
    else if (self.searchResult && self.fetchStatus == ZCDataFetchStatusFetching){
        message = @"Loading more search results...";
    }
    else if (!self.searchResult) {
        message =  @"Fetching search items....";
    }
    
    NSMutableDictionary *loaderDict = [NSMutableDictionary dictionary];
    [loaderDict setObject:message forKey:SEARCH_LOADING_MESSAGE];
    if (payload) {
        [loaderDict setObject:payload forKey:SEARCH_LOADING_PAYLOAD];
    }
    [((ZCLoadMoreCellView *)headerView) confiureHeaderWithModel:loaderDict];
    [((ZCLoadMoreCellView *)headerView) setDelegate:searchViewController];
    return headerView;
}

- (UIView *) searchViewController:(ZCHomeViewController *) searchViewController footerItemForSection:(NSInteger) section{
    return nil;
}

@end
