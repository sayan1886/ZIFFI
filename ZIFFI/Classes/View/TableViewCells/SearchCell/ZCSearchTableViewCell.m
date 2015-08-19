//
//  ZCSearchTableViewCell.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCSearchTableViewCell.h"
#import "ZCSearchCell.h"
#import "ZCLoadMoreCellView.h"

@implementation ZCSearchTableViewCell

-  (instancetype) initWithStyle:(UITableViewCellStyle)style andCellType:(ZCSearchCellType) cellType{
    ZCSearchTableViewCell *cell = nil;
    switch (cellType) {
        case ZCSearchCellTypeResult:
            cell = [[ZCSearchCell alloc] initWithStyle:style reuseIdentifier:NSStringFromClass([ZCSearchCell class])];
        break;
        default:
            break;
    }
    return cell;
}



+ (NSString *) identifierForCellType:(ZCSearchCellType)cellType {
    NSString *identifier = @"";
    switch (cellType) {
        case ZCSearchCellTypeResult:
            identifier = NSStringFromClass([ZCSearchCell class]);
            break;
        default:
            break;
    }
    return identifier;
}

+ (CGFloat) heightForCellType:(ZCSearchCellType) cellType {
    CGFloat height = 0.0;
    switch (cellType) {
        case ZCSearchCellTypeResult:
            height = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ? 300.0f : 400.0f;
            break;
        default:
            break;
    }
    return height;
}

+ (CGFloat) heightForHeaderView{
    return 60.0f;
}

+ (CGFloat) heightForFooterView{
    return 60.0f;
}


- (void) configureCellWithModel:(id)object{
    
}



@end
