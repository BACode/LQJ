//
//  Macro.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/28.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/** 版本info */
#define IosAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/** 通知 代理 info */
#define NoticDefaultCenter                  [NSNotificationCenter defaultCenter]
#define kNOTIFICATION_REFRESHREWARDWALL  @"NOTIFICATION_REFRESHREWARDWALL"
#define PostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj]
#define PostMoreNotification(name,obj,userinfo)   [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj userInfo:userinfo];

#define AddNotificationObserver(observer,sel,notiName,obj) [[NSNotificationCenter defaultCenter] addObserver:observer selector:sel name:notiName object:obj]
#define ApplicationDelegate                 ((BubblyAppDelegate *)[[UIApplication sharedApplication] delegate])
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define SharedApplication                   [UIApplication sharedApplication]

/** bundle info */
#define Bundle                              [NSBundle mainBundle]
#define MainScreen                          [UIScreen mainScreen]
#define StatusBarHeight                     [UIApplication sharedApplication].statusBarFrame.size.height
#define SelfDefaultToolbarHeight            self.navigationController.navigationBar.frame.size.height
#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]
#define isIpad                              ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define isIos7                              ([[[UIDevice currentDevice] systemVersion] floatValue])
#define ISIOS7Later                         !(IOSVersion < 7.0)
#define ISIOS8Later                         !(IOSVersion < 8.0)
#define ISIOS8DianThreeLater                !(IOSVersion < 8.3)
#define ISIOS10DianThreeLater               !(IOSVersion < 10.0)

/** 状态 info */
#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define NetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x

/** frame info */
#define SelfNavBar                          self.navigationController.navigationBar
#define SelfTabBar                          self.tabBarController.tabBar
#define SelfNavBarHeight                    self.navigationController.navigationBar.bounds.size.height
#define SelfTabBarHeight                    self.tabBarController.tabBar.bounds.size.height
#define ScreenRect                          [[UIScreen mainScreen] bounds]
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define StatusbarSize                       ((isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)?20.f:0.f)
#define TouchHeightDefault                  44.f
#define TouchHeightSmall                    32.f
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y
#define SelfViewHeight                      self.view.bounds.size.height
#define RectMaxX(f)                         CGRectGetMaxX(f)
#define RectMaxY(f)                         CGRectGetMaxY(f)
#define RectMinX(f)                         CGRectGetMinX(f)
#define RectMinY(f)                         CGRectGetMinY(f)
#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y
#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectSetX(f, x)                      CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectSetY(f, y)                      CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectSetSize(f, w, h)                CGRectMake(RectX(f), RectY(f), w, h)
#define RectSetOrigin(f, x, y)              CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)
#define Size(w, h)                          CGSizeMake(w, h)
#define Point(x, y)                         CGPointMake(x, y)

/** 常用空间高度设置 */
#define SCALE (ScreenWidth/375.0)           //以主流iPhone6为基准
#define TabBarHeight                        49.0f
#define NaviBarHeight                       44.0f
#define HeightFor4InchScreen                568.0f
#define HeightFor3p5InchScreen              480.0f
#define ViewCtrlTopBarHeight                (ISIOS7Later ? (NaviBarHeight + StatusBarHeight) : NaviBarHeight)
#define IsUseIOS7SystemSwipeGoBack          (ISIOS7Later ? YES : NO)

/** weakSelf */
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define AppKeyWindow  [UIApplication sharedApplication].keyWindow

/** font info */
#define CustomFont(s)  [UIFont systemFontOfSize:s]

/** color info */
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
// RGB颜色转换带alpha（16进制->RGB）
#define XBColorWith16Value(rgbValue,a)\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:a]

// RGB颜色
#define R_G_B_16(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define MasterColorA(x)                     RGBA(255, 153, 0, x)
#define NavTitleColor                       RGB(151, 51, 51)         //导航字体颜色
#define MasterColor                         [BAHelper colorWithHexString:@"F55231"]
#define TextCodeBtnGrayColor                [BAHelper colorWithHexString:@"AFB1B7"]
#define listTitleColor                      [BAHelper colorWithHexString:@"333333"]
#define TableViewLineColor                  [BAHelper colorWithHexString:@"E4E5EC"] //灰色背景


/** 设置字号(根据6屏的字号x) info */
#define textFontSize(x)                     (ScreenWidth==320?(x-1):((ScreenWidth==375)?x:x+1))
#define fPadding                            (ScreenWidth==320?16:((ScreenWidth==375)?12:16))

/** 网络状态提示 info */
#define   NetworkMsg              @"网络异常，请稍后重试"
#define   NetworkConnectionMsg    @"网络异常，请检查网络！"//@"网络连接失败,请查看网络是否连接正常"
#define   NoDataMsg               @"暂无数据"
#define   kNoDataMsg            @"暂无数据"       //没有数据
#define   kNoNetworkMsg         @"网络不给力"      //没有网络
#define   NoDataViewHeight   (ScreenWidth==320?170:((ScreenWidth==375)?191:206))//空数据View的高度

/** 线程 info */
#define __async_opt__  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define __async_main__ dispatch_async(dispatch_get_main_queue()

/** 更新URL */
#define trackUrl @"http://itunes.apple.com/cn/app/id1273642201?mt=8"
#define commentUrl @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=978273898"

/** DEBUG */
#ifdef DEBUG
#define BALog(...)  NSLog(__VA_ARGS__)
#else
#define BALog(...)
#endif


/** 分页显示条数 */
#define pageSizeNum  10  //列表数据每页请求的条数

#endif /* Macro_h */
