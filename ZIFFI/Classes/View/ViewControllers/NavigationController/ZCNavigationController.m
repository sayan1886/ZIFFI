//
//  ZCNavigationController.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 17/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCNavigationController.h"

@interface ZCNavigationController ()

@end

@implementation ZCNavigationController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self customUISetup];
    }
    return self;
}

- (instancetype) init{
    if (self = [super init]) {
        [self customUISetup];
    }
    return self;
}

- (void) customUISetup {
    // Custom initialization
    self.navigationBar.translucent = YES;
    self.navigationBar.tintColor = [UIColor whiteColor];
    [[self navigationBar] setUserInteractionEnabled:NO];
    [[self navigationBar] setMultipleTouchEnabled:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[self navigationBar] respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ){
        
        if (!_navBarImage) {
            self.navBarImage = [UIImage imageNamed:@"navheader.png"];;
        }
        [[self navigationBar] setBackgroundImage:_navBarImage forBarMetrics:UIBarMetricsDefault];
    }
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = COLOR_WITH_RED_GREEN_BLUE_APLPHA(COLOR_FRACTION(0.0f), COLOR_FRACTION(0.0f), COLOR_FRACTION(0.0f), 0.8f);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:COLOR_WITH_RED_GREEN_BLUE(COLOR_FRACTION(245.0), COLOR_FRACTION(245.0), COLOR_FRACTION(245.0)), NSForegroundColorAttributeName, shadow, NSShadowAttributeName,[UIFont fontWithName:APPLICATION_FONT size:NAV_BAR_TITLE_FONT_SIZE], NSFontAttributeName, nil]];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Orientation

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 60000
-(BOOL)shouldAutorotate {
    return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations {
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
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
