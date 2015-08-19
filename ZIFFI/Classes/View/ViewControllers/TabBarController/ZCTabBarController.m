//
//  ZCTabBarController.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 17/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCTabBarController.h"

@interface ZCTabBarController ()

@end

@implementation ZCTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = COLOR_WITH_RED_GREEN_BLUE_APLPHA(COLOR_FRACTION(0.0f), COLOR_FRACTION(0.0f), COLOR_FRACTION(0.0f), 0.8f);
    
    [[UITabBarItem appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:COLOR_WITH_RED_GREEN_BLUE(COLOR_FRACTION(245.0), COLOR_FRACTION(245.0), COLOR_FRACTION(245.0)), NSForegroundColorAttributeName, shadow, NSShadowAttributeName,[UIFont fontWithName:APPLICATION_FONT size:TAB_BAR_TITLE_FONT_SIZE], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:COLOR_WITH_RED_GREEN_BLUE(COLOR_FRACTION(39.0), COLOR_FRACTION(136.0), COLOR_FRACTION(142.0)), NSForegroundColorAttributeName, shadow, NSShadowAttributeName,[UIFont fontWithName:APPLICATION_FONT size:TAB_BAR_TITLE_FONT_SIZE], NSFontAttributeName, nil] forState:UIControlStateSelected];
    
    [[UITabBar appearance] setTintColor:COLOR_WITH_RED_GREEN_BLUE(COLOR_FRACTION(39.0), COLOR_FRACTION(136.0), COLOR_FRACTION(142.0))];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Orientation

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 60000
- (BOOL)shouldAutorotate
{
    return [self.selectedViewController shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
    
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
    
}
#else
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}
#endif // __IPHONE_OS_VERSION_MAX_ALLOWED

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
