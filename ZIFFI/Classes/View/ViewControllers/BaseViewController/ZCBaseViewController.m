//
//  ZCBaseViewController.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 17/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCBaseViewController.h"

@interface ZCBaseViewController ()

@end

@implementation ZCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Navigation Bar

- (void) setNavigationTitle:(NSString *)title{
    self.navigationItem.title = title;
}

- (void) setNavigationTitleView:(UIView *)titleView{
    self.navigationItem.titleView = titleView;
}

- (void) toggleNavigationBackButton:(BOOL)toggle{
    [self.navigationItem setHidesBackButton:toggle animated:YES];
}

- (void) addNavigationLeftButtonWithTitle:(NSString *) title{
    [self toggleNavigationBackButton:YES];
    [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(actionForLeftNavigationButton:)] animated:YES];
}
- (void) addNavigationRightButtonWithTitle:(NSString *) title{
    [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(actionForRightNavigationButton:)] animated:YES];
}

- (void) addNavigationLeftButton:(UIBarButtonItem *)barButton {
    [[self navigationItem] setLeftBarButtonItem:barButton];
}

- (void) addNavigationRightButton:(UIBarButtonItem *)barButton {
    [[self navigationItem] setRightBarButtonItem:barButton];
}

#pragma mark - Public Methods

- (void) pushViewController:(UIViewController *)viewController{
    if ([self respondsToSelector:@selector(showViewController:sender:)]){
        //iOS 8.0 +
        [self showViewController:viewController sender:nil];
    }
    else{
        [[self navigationController]pushViewController:viewController animated:YES];
    }
}

#pragma mark - UIActions

- (IBAction)actionForLeftNavigationButton:(id)sender{
    ZCLog(@"Left Navigation Bar Tapped");
}

- (IBAction)actionForRightNavigationButton:(id)sender{
    ZCLog(@"Right Navigation Bar Tapped");
}

#pragma mark - Memory

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
