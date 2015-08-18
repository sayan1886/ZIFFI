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

@interface ZCHomeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *searchResultView;
@end

@implementation ZCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setNavigationTitle:HOME_VIEW_CONTROLLER_NAVIGATION_TITLE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZCSearchCellType cellType = indexPath.row ;
    ZCSearchTableViewCell *searchTableViewCell = [tableView dequeueReusableCellWithIdentifier:[ZCSearchTableViewCell identifierForCellType:cellType]];
    if (!searchTableViewCell){
        searchTableViewCell = [[ZCSearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault andCellType:cellType];
        searchTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [searchTableViewCell configureCellWithModel:@""];
    return searchTableViewCell;
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZCSearchCellType cellType = indexPath.row ;
    return [ZCSearchTableViewCell heightForCellType:cellType];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height = 54.0f;
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [ZCSearchHeaderView createViewFormNib:nil];
    return view;
}

@end
