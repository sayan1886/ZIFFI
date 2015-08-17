//
//  ZCSearchHeaderView.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCSearchHeaderView.h"

@interface ZCSearchHeaderView ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end

@implementation ZCSearchHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSString *) searchPhrase{
    return self.searchBar.text;
}

#pragma mark - UISearchBarDelegate

@end
