//
//  ViewController.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 17/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCBaseViewController.h"
#import "ZCSearchTableViewCell.h"

@class ZCHomeViewController;
@class ZCSearchTableViewCell;

@protocol ZCSearchViewControllerDataSource <NSObject>

- (id) searchViewController:(ZCHomeViewController *) searchViewController searchItemAtIndexPath:(NSIndexPath *) indexPath;

- (ZCSearchCellType) searchViewController:(ZCHomeViewController *) searchViewController searchCellTypeAtIndex:(NSIndexPath *) indexPath;

- (NSInteger) searchViewController:(ZCHomeViewController *) searchViewController numberOfRowsInSection:(NSInteger) section;

- (NSInteger) numberOfSectionsInHomeViewController:(ZCHomeViewController *) searchViewController;

- (CGFloat) searchViewController:(ZCHomeViewController *) searchViewController heightForHeaderInSection:(NSInteger) section;

- (CGFloat) searchViewController:(ZCHomeViewController *) searchViewController heightForFooterInSection:(NSInteger) section;

- (UIView *) searchViewController:(ZCHomeViewController *) searchViewController headerItemForSection:(NSInteger) section;

- (UIView *) searchViewController:(ZCHomeViewController *) searchViewController footerItemForSection:(NSInteger) section;

@end

@interface ZCHomeViewController : ZCBaseViewController

@property (nonatomic, assign) id<ZCSearchViewControllerDataSource> datasource;

@end

