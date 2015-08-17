//
//  ZCSearchTableViewCell.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCBaseTableViewCell.h"

typedef NS_ENUM(NSInteger, ZCSearchCellType){
    ZCSearchCellTypeResult = 0,
    ZCSearchCellTypeLoadMore = 1
};

@interface ZCSearchTableViewCell : ZCBaseTableViewCell
-  (instancetype) initWithStyle:(UITableViewCellStyle)style andCellType:(ZCSearchCellType) cellType;
+ (NSString *) identifierForCellType:(ZCSearchCellType)cellType;
+ (CGFloat) heightForCellType:(ZCSearchCellType) cellType;
@end
