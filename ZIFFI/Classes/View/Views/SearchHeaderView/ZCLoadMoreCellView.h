//
//  ZCLoadMoreCell.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCBaseView.h"


@protocol ZCLoadMoreCellDelegate <NSObject>

- (void) loadMoreCellView:(UIView *)loadMoreCellView didPressRetrySearch:(id)sender;

@end

@interface ZCLoadMoreCellView : ZCBaseView

@property (nonatomic, assign) id<ZCLoadMoreCellDelegate> delegate;

- (void) confiureHeaderWithModel:(id)object;

+ (CGFloat) heightForHeaderView;
+ (CGFloat) heightForFooterView;

@end
