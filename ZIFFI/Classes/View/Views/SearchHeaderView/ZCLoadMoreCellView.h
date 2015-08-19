//
//  ZCLoadMoreCell.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCBaseView.h"

@interface ZCLoadMoreCellView : ZCBaseView
@property (nonatomic, strong) NSString *loaderMessage;

- (void) confiureHeaderWithModel:(id)object;

+ (CGFloat) heightForHeaderView;
+ (CGFloat) heightForFooterView;

@end
