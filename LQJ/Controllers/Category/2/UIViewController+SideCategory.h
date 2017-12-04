//
//  UIViewController+SideCategory.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/30.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BASideViewController;

@interface UIViewController (SideCategory)
/**
 获取BASideViewController
 */
@property (nonatomic, strong, readonly)BASideViewController *sideViewController;
/**
 左侧VC push操作
 */
- (void)sidePushViewController:(UIViewController *)viewController animated:(BOOL)animated;
/**
 打开侧拉栏
 */
- (void)sideOpenVC;
@end
