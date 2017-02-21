//
//  UINavigationBar+ConverView.m
//  NavigationCover
//
//  Created by chen cx on 2017/2/16.
//  Copyright © 2017年 chen cx. All rights reserved.
//

#import "UINavigationBar+ConverView.h"
#import <objc/runtime.h>
static char key;

@implementation UINavigationBar (ConverView)

- (void)setConverView:(UIView *)converView {
    objc_setAssociatedObject(self, &key, converView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView*)converView {
    return objc_getAssociatedObject(self, &key);
}

- (void)setNavigationBarConver:(UIScrollView *)scrollView
                         color:(UIColor *)color
                       originY:(CGFloat)originY {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > originY) {
        CGFloat alpha = MIN(1, 1-((originY + 64 - offsetY)/64));
        [self setConverViewBackgroundColor:[color colorWithAlphaComponent:alpha]];
        if (alpha>=1) {
            [self setShadowImage:nil];
        }
    } else {
        [self setConverViewBackgroundColor:[color colorWithAlphaComponent:0]];
        [self setShadowImage:[UIImage new]];
    }
    
}

- (void)setConverViewBackgroundColor:(UIColor *)color {
    if (!self.converView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
        UIView * aView = [[UIView alloc]initWithFrame:({
            CGRect rect = {0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)+20};
            rect;
        })];
        aView.userInteractionEnabled = NO;
        aView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self insertSubview:aView atIndex:0];
        aView.backgroundColor = color;
        self.converView = aView;
        return ;
    }
    self.converView.backgroundColor = color;
}

- (void)_setElementsAlpha:(CGFloat)alpha {
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView * view = obj;
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView * view = obj;
        view.alpha = alpha;
    }];
    
    UIView * titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    
    [[self subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemViews")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}

- (void)_setTranslationY:(CGFloat)translationY {
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)_resetConverView {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.converView removeFromSuperview];
    self.converView = nil;
}

@end
