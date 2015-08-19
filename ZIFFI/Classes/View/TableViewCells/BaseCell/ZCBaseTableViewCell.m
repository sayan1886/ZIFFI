//
//  ZCBaseTableViewCell.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCBaseTableViewCell.h"

@implementation ZCBaseTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSString *deviceString = @"iPhone";
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            deviceString = @"iPad";
        }
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
        // observe attendees property
        [self setValue:NSStringFromClass([self class]) forKey:@"reuseIdentifier"];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Public Methods

- (void) configureCellWithModel:(id) object{
    ZCLog(@"Need to Implemented by Child Classes");
}

- (void) configureHeaderWithModel:(id)object{
    ZCLog(@"Need to Implemented by Child Classes");
}

- (void) configureFooterWithModel:(id)object{
    ZCLog(@"Need to Implemented by Child Classes");
}

@end
