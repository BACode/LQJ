//
//  UIViewController+SideCategory.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/30.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "UIViewController+SideCategory.h"
#import "BASideViewController.h"

@implementation UIViewController (SideCategory)
- (BASideViewController *)sideViewController
{
    return (BASideViewController *)SharedApplication.delegate.window.rootViewController;
}

- (void)sidePushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.sideViewController closeSideVC];
    [self.sideViewController.currentNavController pushViewController:viewController animated:animated];
}

- (void)sideOpenVC
{
    [self.sideViewController openSideVC];
}

@end
