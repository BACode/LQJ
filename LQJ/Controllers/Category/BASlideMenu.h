//
//  BASlideMenu.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/28.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+BASlideMenu.h"

@interface BASlideMenu : BABaseViewController

#pragma mark -
//主视图
@property (nonatomic, strong) UIViewController *rootViewController;
//左侧视图
@property (nonatomic, strong) UIViewController *leftViewController;
//右侧视图
@property (nonatomic, strong) UIViewController *rightViewController;
//菜单宽度
@property (nonatomic, assign, readonly) CGFloat menuWidth;
//留白宽度
@property (nonatomic, assign, readonly) CGFloat emptyWidth;
//是否允许滚动
@property (nonatomic ,assign) BOOL slideEnabled;

#pragma mark -
//创建方法
-(instancetype)initWithRootViewController:(UIViewController*)rootViewController;
//显示主视图
-(void)showRootViewControllerAnimated:(BOOL)animated;
//显示左侧菜单
-(void)showLeftViewControllerAnimated:(BOOL)animated;
//显示右侧菜单
-(void)showRightViewControllerAnimated:(BOOL)animated;

@end
