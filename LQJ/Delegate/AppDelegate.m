//
//  AppDelegate.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/28.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "AppDelegate.h"
#import "BAMainController.h"
#import "BASlideMenu.h"
#import "BALeftController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BALog(@"didFinishLaunchingWithOptions.......");

    // init window
    self.window = [[UIWindow alloc] initWithFrame:ScreenRect];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //主界面
    BAMainController *mainVC = [[BAMainController alloc] init];
    //配置NavigationBar
    UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [rootNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarBackImage"] forBarMetrics:UIBarMetricsDefault];
    rootNav.navigationBar.tintColor = [UIColor whiteColor];
    [rootNav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    //左侧菜单
    BALeftController *leftVC = [[BALeftController alloc] init];
    //右侧菜单
//    BARightController *rightVC = [[BARightController alloc] init];
    //创建滑动菜单
    BASlideMenu *slideMenu = [[BASlideMenu alloc] initWithRootViewController:rootNav];
    //设置左右菜单
    slideMenu.leftViewController = leftVC;
//    slideMenu.rightViewController = rightVC;
    self.window.rootViewController = slideMenu;
    
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
