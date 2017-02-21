//
//  BaseViewController.h
//  NavigationCover
//
//  Created by chen cx on 2017/2/16.
//  Copyright © 2017年 chen cx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/** 导航栏渐变 */
- (void)setNavigationBarCover:(UIScrollView *)scrollView
                        color:(UIColor *)color
                      originy:(CGFloat)originy;

@end
