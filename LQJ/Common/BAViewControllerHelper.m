//
//  BAViewControllerHelper.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BAViewControllerHelper.h"

/**<   导入模块类   */
#import "BAHomeController.h"
#import "BALiveStreamController.h"
#import "BAIconController.h"
#import "BACircleController.h"
#import "BADataController.h"

@implementation BAViewControllerHelper

+(UITabBarController *)createTabBarController
{
    // 首页
    BAHomeController *homeVC = [[BAHomeController alloc] init];
    homeVC.title = @"首页";
    BANavigationController *homeNav = [[BANavigationController alloc] initWithRootViewController:homeVC];
    homeNav.hidesBottomBarWhenPushed = YES;
  
    // 直播
    BALiveStreamController *liveVC = [[BALiveStreamController alloc] init];
    liveVC.title = @"直播";
    BANavigationController *liveNav = [[BANavigationController alloc] initWithRootViewController:liveVC];
    liveNav.hidesBottomBarWhenPushed = YES;
    
    // iCon
    BAIconController *iConVC = [[BAIconController alloc] init];
    iConVC.title = @"iCon";
    BANavigationController *iConNav = [[BANavigationController alloc] initWithRootViewController:iConVC];
    iConNav.hidesBottomBarWhenPushed = YES;
    
    // 圈子
    BACircleController *circleVC = [[BACircleController alloc] init];
    circleVC.title = @"圈子";
    BANavigationController *circleNav = [[BANavigationController alloc] initWithRootViewController:circleVC];
    circleNav.hidesBottomBarWhenPushed = YES;
    
    // 数据
    BADataController *dataVC = [[BADataController alloc] init];
    dataVC.title = @"数据";
    BANavigationController *dataNav = [[BANavigationController alloc] initWithRootViewController:dataVC];
    dataNav.hidesBottomBarWhenPushed = YES;

    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.tabBar.translucent = NO;
    tabBarVC.selectedIndex = 1;
    [tabBarVC setSelectedIndex:1];
    tabBarVC.tabBar.backgroundColor = RGBA(238, 238, 238, 1.0);
    
    [tabBarVC setViewControllers:@[homeNav, liveNav, iConNav, circleNav, dataNav]];
    
    [BAViewControllerHelper customizeTabBarForController:tabBarVC];
    
    UIView* lineView = [[UIView alloc] initWithFrame:Rect(0, 0, ScreenWidth, 1)];
    lineView.backgroundColor=RGB(230, 230, 230);
//    lineView.tag=1122;
    [tabBarVC.tabBar addSubview:lineView];
    
    return tabBarVC;
}

+ (void)customizeTabBarForController:(UITabBarController *)tabBarController{
    
    //    if (![RDInputValidator connectedToNetwork]) {
    NSArray *tabBarItemImages = @[@"首页", @"直播", @"iCon", @"圈子", @"数据"];
    NSArray *tabBarItemTitles = @[@"首页", @"直播", @"", @"圈子", @"数据"];
    
    NSInteger index = 0;
    for (UITabBarItem *item in [[tabBarController tabBar] items]) {
//        item.backgroundColor = RGB(255, 255, 255);
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@选中",
                                                      [tabBarItemImages 
                                                       objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item setTitle:tabBarItemTitles[index]];
//        item.badgeTextColor = [UIColor whiteColor];
//        item.badgeBackgroundColor = [UIColor redColor];
//        item.badgeTextFont = [UIFont systemFontOfSize:12.f];
//        item.selectedTitleAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:9],NSForegroundColorAttributeName: RGB(255, 83, 83)};
//        item.unselectedTitleAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:9],NSForegroundColorAttributeName: RGB(102, 102, 102)};
        item.tag = index;
//        NSLog(@"itemF ==%@",NSStringFromCGRect(item.frame));
        
        index++;
    }
    
}

@end
