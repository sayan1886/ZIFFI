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

@interface ZCAppManager () <ZCSearchViewControllerDataSource>
@property (nonatomic, strong) NSDictionary *searchParams;
@property (nonatomic, strong) ZCSearchResultModel *searchResult;
@end

@implementation ZCAppManager

+ (instancetype) sharedAppManager{
    return SHARED_INSTANCE([[self alloc] init]);
}

- (id) init {
    if ( (self = [super init]) ) {
        // Initialization code here.
        self.searchParams = @{@"vertical" : @"salons-spas",
                              @"city_id" : @"4",
                              @"q" : @"Hair Spa",
                              @"page" : @"0"
                              };
    }
    return self;
}


- (void) searchInZiffiWithSearchPhrase:(NSString *)searchPhrase withCompletionHandler:(ZCAppManagerCompletionHandler)handler{
    __weak typeof(self) weakSelf = self;
    [[ZCNetworkManager defaultNetworkManager] POSTtoPath:SEARCH_URL_PATH withParameters:self.searchParams success:^(id response) {
        NSError *error = nil;
        weakSelf.searchResult = [[ZCSearchResultModel alloc] initWithDictionary:response error:&error];
        handler(@{@"status" : @"Success"});
    } failure:^(id failureMessage, NSError *error) {
        handler(@{@"status" : @"Fail", @"error" : error.debugDescription});;
    }];
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
    if (!self.searchResult) {
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
    ZCLoadMoreCellView *headerView = [ZCLoadMoreCellView createViewFormNib:nil];
    [headerView setLoaderMessage:@"Fetching Search Items...."];
    return headerView;
}

- (UIView *) searchViewController:(ZCHomeViewController *) searchViewController footerItemForSection:(NSInteger) section{
    return nil;
}

@end
