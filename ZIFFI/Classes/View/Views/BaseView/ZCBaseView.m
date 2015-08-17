//
//  ZCBaseView.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCBaseView.h"

@implementation ZCBaseView

+ (instancetype) createViewFormNib:(NSString *)nibNameOrNil{
    NSString *nibName = nibNameOrNil ? nibNameOrNil : NSStringFromClass([self class]);
    NSArray *xibArray = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    ZCBaseView *view  = [xibArray objectAtIndex:0];
    return view;
}

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
