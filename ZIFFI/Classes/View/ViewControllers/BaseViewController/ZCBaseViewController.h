//
//  ZCBaseViewController.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 17/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCBaseViewController : UIViewController

- (IBAction) actionForLeftNavigationButton:(id) sender;
- (IBAction) actionForRightNavigationButton:(id) sender;

- (void) pushViewController:(UIViewController *)viewController;

- (void) setNavigationTitle:(NSString *)title;
- (void) setNavigationTitleView:(UIView *)titleView;

- (void) toggleNavigationBackButton:(BOOL)toggle;

- (void) addNavigationLeftButtonWithTitle:(NSString *) title;
- (void) addNavigationLeftButton:(UIBarButtonItem *)barButton;
- (void) addNavigationRightButton:(UIBarButtonItem *)barButton;
- (void) addNavigationRightButtonWithTitle:(NSString *) title;

@end
