//
//  MBProgressHUDManger.m
//  JTS
//
//  Created by Borago on 2017/5/3.
//  Copyright © 2017年 JinTouShou. All rights reserved.
//

#import "MBProgressHUDManger.h"

#define kGloomyBlackColor  [UIColor colorWithRed:0 green:0 blue:0 alpha:1]
#define kGloomyClearCloler  [UIColor colorWithRed:1 green:1 blue:1 alpha:0]

/* 默认网络提示，可在这统一修改 */
static NSString *const kLoadingMessage = @"加载中";

/* 默认简短提示语显示的时间，在这统一修改 */
static CGFloat const   kShowTime  = 2.0f;

/* 默认超时时间，30s后自动去除提示框 */
static NSTimeInterval const interval = 30.0f;

/* 手势是否可用，默认yes，轻触屏幕提示框隐藏 */
static BOOL isAvalibleTouch = YES;

@implementation MBProgressHUDManger

UIView *gloomyView;     //深色背景
UIView *prestrainView;  //预加载view
BOOL isShowGloomy;      //是否显示深色背景
    
#pragma mark -   类初始化
+ (void)initialize {
    if (self == [MBProgressHUDManger self]) {
        //该方法只会走一次
        [self customView];
    }
}
#pragma mark - 初始化gloomyView
+(void)customView {
    gloomyView = [[GloomyView alloc] initWithFrame:Rect(0, 0, ScreenWidth, ScreenHeight)];
    gloomyView.backgroundColor = kGloomyBlackColor;
    gloomyView.hidden = YES;
    isShowGloomy = YES;
}

+ (void)showGloomy:(BOOL)isShow {
    isShowGloomy = isShow;
}

#pragma mark - 简短提示语
+ (void) showBriefAlert:(NSString *) message inView:(UIView *) view{
    dispatch_async(dispatch_get_main_queue(), ^{
        prestrainView = view;
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view ?:SharedApplication.keyWindow animated:YES];
        hud.labelText = message;
        hud.animationType = MBProgressHUDAnimationZoom;
        hud.mode = MBProgressHUDModeText;
        hud.margin = 10.f;
        //HUD.yOffset = 200;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:kShowTime];
    });
}
#pragma mark - 长时间的提示语
+ (void) showPermanentMessage:(NSString *)message inView:(UIView *)view {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        prestrainView = view;
        gloomyView.frame = view ? Rect(0, 0, view.frame.size.width, view.frame.size.height):
        Rect(0, 0, ScreenWidth, ScreenHeight);
//        gloomyView.backgroundColor = [UIColor whiteColor];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:gloomyView animated:YES];
        hud.labelText = message;
        hud.animationType = MBProgressHUDAnimationZoom;
        hud.mode = MBProgressHUDModeCustomView;
        hud.removeFromSuperViewOnHide = YES;
        hud.mode = MBProgressHUDModeText;
        [gloomyView addSubview:hud];
        [self showClearGloomyView];
        [hud show:YES];
        
    });
    
}
#pragma mark - 网络加载提示用
+ (void) showLoadingInView:(UIView *) view{
    dispatch_async(dispatch_get_main_queue(), ^{
        prestrainView = view;
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:gloomyView];
        hud.labelText = kLoadingMessage;
        hud.removeFromSuperViewOnHide = YES;
        gloomyView.frame = view ? CGRectMake(0, 0, view.frame.size.width, view.frame.size.height):
        Rect(0, 0, ScreenWidth, ScreenHeight);
        if (isShowGloomy) {
            [self showBlackGloomyView];
        }else {
            [self showClearGloomyView];
        }
        [gloomyView addSubview:hud];
        [hud show:YES];
        [self hideAlertDelay];
    });
}
+ (void)showWaitingWithTitle:(NSString *)title inView:(UIView *)view {
    dispatch_async(dispatch_get_main_queue(), ^{
        prestrainView = view;
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:gloomyView];
        hud.labelText = title;
        hud.removeFromSuperViewOnHide = YES;
        gloomyView.frame = view ? Rect(0, 0, view.frame.size.width, view.frame.size.height):
        Rect(0, 0, ScreenWidth, ScreenHeight);
        if (isShowGloomy) {
            [self showBlackGloomyView];
        }else {
            [self showClearGloomyView];
        }
        
        [gloomyView addSubview:hud];
        [hud show:YES];
        [self hideAlertDelay];
    });
}
+(void)showAlertWithCustomImage:(NSString *)imageName title:(NSString *)title inView:(UIView *)view{
    dispatch_async(dispatch_get_main_queue(), ^{
        prestrainView = view;
        gloomyView.frame = view ? CGRectMake(0, 0, view.frame.size.width, view.frame.size.height):
        Rect(0, 0, ScreenWidth, ScreenHeight);
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view ?:SharedApplication.keyWindow animated:YES];
        UIImageView *littleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
        littleView.image = [UIImage imageNamed:imageName];
        hud.customView = littleView;
        hud.removeFromSuperViewOnHide = YES;
        hud.animationType = MBProgressHUDAnimationZoom;
        hud.labelText = title;
        hud.mode = MBProgressHUDModeCustomView;
        [hud show:YES];
        [hud hide:YES afterDelay:kShowTime];
    });
}
#pragma mark - 加载在window上的提示框
+(void)showLoading{
    [self showLoadingInView:nil];
}
+ (void)showWaitingWithTitle:(NSString *)title{
    [self showWaitingWithTitle:title inView:nil];
}
+(void)showBriefAlert:(NSString *)alert{
    [self showBriefAlert:alert inView:nil];
}
+(void)showPermanentAlert:(NSString *)alert{
    [self showPermanentMessage:alert inView:nil];
}
+(void)showAlertWithCustomImage:(NSString *)imageName title:(NSString *)title {
    [self showAlertWithCustomImage:imageName title:title inView:nil];
}

#pragma mark -   GloomyView背景色
+ (void)showBlackGloomyView {
//    gloomyView.backgroundColor = RGB(200, 200, 200);
    gloomyView.backgroundColor = [UIColor whiteColor];
    [self gloomyConfig];
}
+ (void)showClearGloomyView {
    gloomyView.backgroundColor = [UIColor clearColor];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self gloomyConfig];
    });
}
#pragma mark -   决定GloomyView add到已给view或者window上
+ (void)gloomyConfig {
    gloomyView.hidden = NO;
    gloomyView.alpha = 1;
    if (prestrainView) {
        [prestrainView addSubview:gloomyView];
    }else {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        if (![window.subviews containsObject:gloomyView]) {
            [window addSubview:gloomyView];
        }
    }
}
#pragma mark - 隐藏提示框
+(void)hideAlert{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUDManger HUDForView:gloomyView];
        [UIView animateWithDuration:0.5 animations:^{
            gloomyView.frame = CGRectZero;
            gloomyView.center = prestrainView ? prestrainView.center: [UIApplication sharedApplication].keyWindow.center;
            gloomyView.alpha = 0;
            hud.alpha = 0;
        } completion:^(BOOL finished) {
            [hud removeFromSuperview];
        }];
    });
    
}
#pragma mark - 超时后（默认30s）自动隐藏加载提示
+ (void)hideAlertDelay {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideAlert];
    });
}
#pragma mark - 获取view上的hud
+ (MBProgressHUD *)HUDForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:[MBProgressHUD class]]) {
            return (MBProgressHUD *)subview;
        }
    }
    return nil;
}

@end


@implementation GloomyView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (isAvalibleTouch) {
        [MBProgressHUDManger hideAlert];
    }
}


@end
