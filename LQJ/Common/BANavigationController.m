//
//  BANavigationController.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BANavigationController.h"
#import "Macro.h"
#import "BANavigationBar.h"
#import <QuartzCore/QuartzCore.h>

@interface BANavigationController ()

@end

@implementation BANavigationController

- (void)dealloc
{
    NSLog(@"BANavigationController dealloc");
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.canDragBack = YES;
        self.hidesBottomBarWhenPushed = YES;
        self.navigationBar.translucent = NO;
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:NavTitleColor,
                                                               NSFontAttributeName:[UIFont boldSystemFontOfSize:18.f]}];
    }
    return self;
}

// 是否可右滑返回
- (void)setCanDragBack:(BOOL)bCanDragBack
{
    if (ISIOS7Later)
    {
        self.interactivePopGestureRecognizer.enabled = bCanDragBack;
    }
}

- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 如果进入的是当前视图控制器
    if (viewController == self) {
        // 背景设置为黑色
        self.navigationController.navigationBar.tintColor = RGB(30, 200, 20);
        // 透明度设置为0.3
        self.navigationController.navigationBar.alpha = 0.300;
        // 设置为半透明
        self.navigationController.navigationBar.translucent = YES;
    } else {
        // 进入其他视图控制器
        self.navigationController.navigationBar.alpha = 1;
        // 背景颜色设置为系统默认颜色
        self.navigationController.navigationBar.tintColor = nil;
        self.navigationController.navigationBar.translucent = NO;
    }
}


@end
