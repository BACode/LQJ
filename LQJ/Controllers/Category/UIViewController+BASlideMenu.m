//
//  UIViewController+BASlideMenu.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/28.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "UIViewController+BASlideMenu.h"
#import "BASlideMenu.h"

@implementation UIViewController (BASlideMenu)

- (BASlideMenu *)sldeMenu {
    UIViewController *sldeMenu = self.parentViewController;
    while (sldeMenu) {
        if ([sldeMenu isKindOfClass:[BASlideMenu class]]) {
            return (BASlideMenu *)sldeMenu;
        } else if (sldeMenu.parentViewController && sldeMenu.parentViewController != sldeMenu) {
            sldeMenu = sldeMenu.parentViewController;
        } else {
            sldeMenu = nil;
        }
    }
    return nil;
}

@end
