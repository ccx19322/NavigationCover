//
//  BaseNaviViewController.m
//  NavigationCover
//
//  Created by chen cx on 2017/2/16.
//  Copyright © 2017年 chen cx. All rights reserved.
//

#import "BaseNaviViewController.h"
#import "UIImage+Extensions.h"

@interface BaseNaviViewController ()

@end

@implementation BaseNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor redColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                    NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
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

@end
