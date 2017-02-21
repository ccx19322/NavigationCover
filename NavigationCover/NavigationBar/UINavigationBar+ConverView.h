//
//  UINavigationBar+ConverView.h
//  NavigationCover
//
//  Created by chen cx on 2017/2/16.
//  Copyright © 2017年 chen cx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (ConverView)
@property (nonatomic, strong) UIView * converView;

- (void)setNavigationBarConver:(UIScrollView *)scrollView
                         color:(UIColor *)color
                       originY:(CGFloat)originY;

- (void)setConverViewBackgroundColor:(UIColor*)color;

- (void)_setElementsAlpha:(CGFloat)alpha;
- (void)_setTranslationY:(CGFloat)translationY;
- (void)_resetConverView;
@end
