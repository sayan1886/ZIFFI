//
//  ZCSearchCell.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCSearchCell.h"
#import "ZCRatingView.h"

@interface ZCSearchCell ()<ZCRatingViewDelegate>
@property (weak, nonatomic) IBOutlet ZCRatingView *ratingView;
@end

@implementation ZCSearchCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) awakeFromNib{
    self.ratingView.notSelectedImage = [UIImage imageNamed:@"empty.png"];
    self.ratingView.halfSelectedImage = [UIImage imageNamed:@"half.png"];
    self.ratingView.fullSelectedImage = [UIImage imageNamed:@"full.png"];
    self.ratingView.rating = 3.5;
    self.ratingView.editable = YES;
    self.ratingView.maxRating = 5;
    self.ratingView.delegate = self;
}

#pragma mark - ZCRatingViewDelegate

- (void)rateView:(ZCRatingView *)rateView ratingDidChange:(CGFloat)rating{
    
}

@end
