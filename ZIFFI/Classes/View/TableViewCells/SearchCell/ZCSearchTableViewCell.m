//
//  ZCSearchTableViewCell.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCSearchTableViewCell.h"
#import "ZCSearchCell.h"
#import "ZCLoadMoreCell.h"

@implementation ZCSearchTableViewCell

-  (instancetype) initWithStyle:(UITableViewCellStyle)style andCellType:(ZCSearchCellType) cellType{
    ZCSearchTableViewCell *cell = nil;
    switch (cellType) {
        case ZCSearchCellTypeResult:
            cell = [[ZCSearchCell alloc] initWithStyle:style reuseIdentifier:NSStringFromClass([ZCSearchCell class])];
            break;
        case ZCSearchCellTypeLoadMore:
            cell = [[ZCLoadMoreCell alloc] initWithStyle:style reuseIdentifier:NSStringFromClass([ZCLoadMoreCell class])];
            break;

        default:
            break;
    }
    return cell;
}

- (void) configureCellWithModel:(id)object{
    
}

+ (NSString *) identifierForCellType:(ZCSearchCellType)cellType {
    NSString *identifier = @"";
    switch (cellType) {
        case ZCSearchCellTypeResult:
            identifier = NSStringFromClass([ZCSearchCell class]);
            break;
        case ZCSearchCellTypeLoadMore:
            identifier = NSStringFromClass([ZCLoadMoreCell class]);
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
            height = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ? 150.0f : 350.0f;
            break;
        case ZCSearchCellTypeLoadMore:
            height = 60.0f;
            break;
        default:
            break;
    }
    return height;
}

@end
