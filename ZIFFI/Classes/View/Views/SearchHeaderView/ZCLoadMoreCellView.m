//
//  ZCLoadMoreCell.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCLoadMoreCellView.h"

@interface ZCLoadMoreCellView ()
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@end

@implementation ZCLoadMoreCellView

- (void)awakeFromNib {
    // Initialization code
}


- (void) setLoaderMessage:(NSString *)loaderMessage{
    if (_loaderMessage != loaderMessage) {
        _loaderMessage = [[NSString alloc] initWithString:loaderMessage];
        self.messageLabel.text = _loaderMessage;
    }
}

- (void) confiureHeaderWithModel:(id)object{
    NSDictionary *model = (NSDictionary *)object;
    self.messageLabel.text = [model objectForKey:SEARCH_LOADING_MESSAGE];
}

+ (CGFloat) heightForHeaderView{
    return 60.0f;
}

+ (CGFloat) heightForFooterView{
    return 0.0f;
}

@end
