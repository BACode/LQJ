//
//  AppDelegate.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/28.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "AppDelegate.h"
#import "BALeftController.h"
#import "BAGuideController.h"
#import "BAViewControllerHelper.h"

/////
#import "BASideViewController.h"
#import "UIViewController+SideCategory.h"


@interface AppDelegate ()
@property (nonatomic, strong) UITabBarController *tabBarController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BALog(@"didFinishLaunchingWithOptions.......");

    // init window
    self.window = [[UIWindow alloc] initWithFrame:ScreenRect];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    //创建bool类型对象来判断是否显示操作指南
    BOOL showGuide = [UserDefaults boolForKey:@"showGuide"];
    
    if (showGuide == NO) {

        //没有显示操作指南，则让其显示
        self.window.rootViewController = [[BAGuideController alloc] init];
        //获取idfa，调用接口同时将idfa数据传递给后台


        //写数据
        [UserDefaults setBool:YES forKey:@"showGuide"];

        //将数据同步到本地的文件中
        [UserDefaults synchronize];
    } else {
        //主VC
        self.tabBarController = [BAViewControllerHelper createTabBarController];

        // 侧拉VC
        BALeftController *leftViewController = [[BALeftController alloc] init];

        // 添加BASideViewController为rootvc
        self.window.rootViewController = [[BASideViewController alloc] initWithSideVC:leftViewController currentVC:self.tabBarController];
    }
    
    // display content
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    BALog(@"applicationWillResignActive.......");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    BALog(@"applicationDidEnterBackground.......");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    BALog(@"applicationWillEnterForeground.......");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    BALog(@"applicationDidBecomeActive.......");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    BALog(@"applicationWillTerminate.......");
}


@end
