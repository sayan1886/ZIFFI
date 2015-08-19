//
//  ZCLoadMoreCell.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCLoadMoreCellView.h"

@interface ZCLoadMoreCellView ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;
@property (weak, nonatomic) IBOutlet UIButton *retryButton;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@end

@implementation ZCLoadMoreCellView

- (void)awakeFromNib {
    // Initialization code
}


- (void) confiureHeaderWithModel:(id)object{
    NSDictionary *model = (NSDictionary *)object;
    [[self loader] startAnimating];
    self.messageLabel.text = [model objectForKey:SEARCH_LOADING_MESSAGE];
    [self.messageLabel sizeToFit];
    [self.messageLabel layoutIfNeeded];
    if ([[model objectForKey:SEARCH_LOADING_PAYLOAD] isKindOfClass:[NSError class]]) {
        [self.loader stopAnimating];
        [self.retryButton setHidden:NO];
    }
}

+ (CGFloat) heightForHeaderView{
    return 60.0f;
}

+ (CGFloat) heightForFooterView{
    return 0.0f;
}

#pragma mark - UIActions

- (IBAction)retrySearch:(id)sender {
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(loadMoreCellView:didPressRetrySearch:)]) {
            [self.delegate loadMoreCellView:self didPressRetrySearch:sender];
            [self.retryButton setHidden:YES];
        }
    }
}

@end
