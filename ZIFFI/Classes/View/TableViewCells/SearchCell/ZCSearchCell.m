//
//  ZCSearchCell.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCSearchCell.h"
#import "ZCRatingView.h"
#import "ZCSearchCategoryModel.h"
#import "ZCHelper.h"

@interface ZCSearchCell ()<ZCRatingViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *bannerImageView;
@property (weak, nonatomic) IBOutlet ZCRatingView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *labelServiceType;
@property (weak, nonatomic) IBOutlet UILabel *labelServiceName;
@property (weak, nonatomic) IBOutlet UILabel *labelAddress;
@property (weak, nonatomic) IBOutlet UILabel *labelServicePrice;
@property (weak, nonatomic) IBOutlet UILabel *labelDistance;
@property (weak, nonatomic) IBOutlet UIButton *buttonBookNow;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
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
    self.ratingView.editable = NO;
    self.ratingView.maxRating = 5;
}

- (void) configureCellWithModel:(id)object{
    
    ZCSearchCategoryModel *searchCellDataModel = (ZCSearchCategoryModel *)object;
    [self.labelAddress setText:searchCellDataModel.address];
    [self.labelDistance setText:searchCellDataModel.distance_max];
    [self.labelServiceName setText:searchCellDataModel.name];
    [self.labelServiceType setText:searchCellDataModel.type];
    [self.loadingIndicator stopAnimating];
    NSString *rupee = @"\u20B9";
    NSString *priceAndService = [NSString stringWithFormat:@"%@ %@ for %@", rupee, searchCellDataModel.fees_min, searchCellDataModel.fees_min_service];
    NSMutableAttributedString *attributedPriceAndService = [[NSMutableAttributedString alloc] initWithString:priceAndService];
    [attributedPriceAndService addAttributes:@{NSForegroundColorAttributeName:COLOR_WITH_RED_GREEN_BLUE(COLOR_FRACTION(39.0), COLOR_FRACTION(136.0), COLOR_FRACTION(142.0)), NSFontAttributeName:[UIFont boldSystemFontOfSize:APPLICATION_BODY_FONT_FONT_SIZE]} range:[priceAndService rangeOfString:searchCellDataModel.fees_min]];
    __weak typeof(self) weakSelf = self;
    [self.labelServicePrice setAttributedText:attributedPriceAndService];
    self.ratingView.rating = [searchCellDataModel.rating floatValue];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) , ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[[[ZCHelper documentsDirectoryURL] URLByAppendingPathComponent:searchCellDataModel.id]  URLByAppendingPathExtension:@"png"]]];
        if (!image) {
            image = [UIImage imageNamed:@"placeholder.jpg"];
            [weakSelf loadBannerForId:searchCellDataModel.id fromURL:searchCellDataModel.image];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.bannerImageView setImage: image];
        });
    });
    
    [self.labelAddress sizeToFit];
    [self.labelAddress sizeToFit];
    [self.labelAddress sizeToFit];
    [self.labelAddress sizeToFit];
    [self.labelAddress sizeToFit];
    
    [self.labelAddress layoutIfNeeded];
    [self.labelAddress layoutIfNeeded];
    [self.labelAddress layoutIfNeeded];
    [self.labelAddress layoutIfNeeded];
    [self.labelAddress layoutIfNeeded];
}

- (void) loadBannerForId:(NSString *)searchID fromURL:(NSString *)urlString{
    [self.loadingIndicator startAnimating];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageURL = [NSURL URLWithString:urlString];
        __weak typeof(self) weakSelf = self;
        NSError *downloadError = nil;
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL options:kNilOptions error:&downloadError];
        if (downloadError) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.loadingIndicator stopAnimating];
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                ZCLog(@"%@",[downloadError localizedDescription]);
            });
        } else {
            NSURL *documentsDirectoryURL = [ZCHelper documentsDirectoryURL];
            NSURL *saveLocation = [[documentsDirectoryURL URLByAppendingPathComponent:searchID]  URLByAppendingPathExtension:@"png"];
            NSError *saveError = nil;
            BOOL writeWasSuccessful = [imageData writeToURL:saveLocation options:kNilOptions error:&saveError];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (writeWasSuccessful) {
                    NSData *imageData = [NSData dataWithContentsOfURL:saveLocation];
                    weakSelf.bannerImageView.image = [UIImage imageWithData:imageData];
                } else {
                    ZCLog(@"%@", [saveError localizedDescription]);
                }
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                [weakSelf.loadingIndicator stopAnimating];
            });
        }
    });
}

@end
