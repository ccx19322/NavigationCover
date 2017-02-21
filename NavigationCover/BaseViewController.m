//
//  BaseViewController.m
//  NavigationCover
//
//  Created by chen cx on 2017/2/16.
//  Copyright © 2017年 chen cx. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavigationBar+ConverView.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setNavigationBarCover:(UIScrollView *)scrollView
                        color:(UIColor *)color
                      originy:(CGFloat)originy{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > originy) {
        CGFloat alpha = MIN(1, 1 - ((originy + 64 - offsetY) / 64));
        [self.navigationController.navigationBar setConverViewBackgroundColor:[color colorWithAlphaComponent:alpha]];
        if (alpha>=1) {
            self.navigationController.navigationBar.shadowImage = nil;
        }
    } else {
        [self.navigationController.navigationBar setConverViewBackgroundColor:[color colorWithAlphaComponent:0]];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
    }
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
