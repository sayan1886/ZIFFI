//
//  ViewController.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 17/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCHomeViewController.h"
#import "ZCSearchHeaderView.h"
#import "ZCSearchTableViewCell.h"
#import "ZCAppManager.h"
#import "ZCNetworkManager.h"

@interface ZCHomeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *searchResultView;
@end

@implementation ZCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[ZCAppManager sharedAppManager] loadSearchDataFromPersistence];
    [self setNavigationTitle:HOME_VIEW_CONTROLLER_NAVIGATION_TITLE];
    [self.searchResultView setBackgroundColor:[UIColor clearColor]];
    [self loadSearchResult];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Search 

- (void) loadSearchResult{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    self.datasource = (id<ZCSearchViewControllerDataSource>)[ZCAppManager sharedAppManager];
    __weak typeof(self) weakSelf = self;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"salons-spas" forKey:@"vertical"];
    [params setValue:@"4" forKey:@"city_id"];
    [params setValue:@"Hair Spa" forKey:@"q"];
    [params setValue:[[ZCAppManager sharedAppManager] page] forKey:@"page"];
    
    [[ZCAppManager sharedAppManager] searchInZiffiWithSearchParam:params withCompletionHandler:^(id handler) {
        NSDictionary *completion = (NSDictionary *)handler;
        if ([[completion objectForKey:@"status"] isEqualToString:@"Success"]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[weakSelf searchResultView] reloadData];
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            });
        }
        else if ([[completion objectForKey:@"status"] isEqualToString:@"Fail"]){
            ZCLog(@"%@", [completion objectForKey:@"error"]);
            dispatch_async(dispatch_get_main_queue(), ^{
                [[weakSelf searchResultView] reloadData];
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            });
        }
    }];
    [self.searchResultView reloadData];
}

#pragma mark - ZCLoadMoreCellDelegate

- (void) loadMoreCellView:(UIView *)loadMoreCellView didPressRetrySearch:(id)sender{
    [[ZCNetworkManager defaultNetworkManager] resetCache];
    [self loadSearchResult];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datasource searchViewController:self numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZCSearchCellType cellType = [self.datasource searchViewController:self searchCellTypeAtIndex:indexPath] ;
    ZCSearchTableViewCell *searchTableViewCell = [tableView dequeueReusableCellWithIdentifier:[ZCSearchTableViewCell identifierForCellType:cellType]];
    if (!searchTableViewCell){
        searchTableViewCell = [[ZCSearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault andCellType:cellType];
        searchTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [searchTableViewCell configureCellWithModel:[self.datasource searchViewController:self searchItemAtIndexPath:indexPath]];
    return searchTableViewCell;
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZCSearchCellType cellType = [self.datasource searchViewController:self searchCellTypeAtIndex:indexPath] ;
    return [ZCSearchTableViewCell heightForCellType:cellType];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [self.datasource searchViewController:self heightForHeaderInSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [self.datasource searchViewController:self headerItemForSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [self.datasource searchViewController:self heightForFooterInSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [self.datasource searchViewController:self footerItemForSection:section];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([indexPath compare:[self lastIndexPath]] == NSOrderedSame) {
        [self loadSearchResult];
    }
}

- (NSIndexPath *) lastIndexPath{
    NSInteger sectionsAmount = [self.searchResultView numberOfSections];
    NSInteger rowsAmount = [self.searchResultView numberOfRowsInSection:sectionsAmount-1];
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:(rowsAmount - 1) inSection:(sectionsAmount - 1)];
    return lastIndexPath;
}

#pragma mark - Memory

- (void) dealloc{
    self.datasource = nil;
}

@end
