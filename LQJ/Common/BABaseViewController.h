//
//  BABaseViewController.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^requestAgainBlock)(void);

typedef enum : NSUInteger {
    JTSReturnTypeLoginSuccess,
    JTSReturnTypeRegisterSuccess,
    JTSReturnTypeCancel,
} JTSReturnType;

typedef void(^BaseCompletionBlock)(JTSReturnType);

#import <UIKit/UIKit.h>
#import "UINavigationItem+BABarButtonItem.h"
#import "BABarButtonItem.h"
#import "BANavigationController.h"
#import "BANavigationBar.h"
#import "Macro.h"
#import "BAStatusView.h"

@class RDGesturePasswordController;

@interface BABaseViewController : UIViewController
{
    UITableView *_tableView;        // 表
    BAStatusView *_statusView;      // 断网提示视图
}


@property (nonatomic, strong) BaseCompletionBlock baseComletionBlock;
@property (nonatomic, strong) requestAgainBlock requestAgainBlock;
@property (nonatomic, strong) UITableView *tableView;   // 表
@property (nonatomic, strong) BAStatusView *statusView; // 状态提示

//@property (nonatomic, assign) BOOL updateWhenDidAppear;

@property (nonatomic, strong) UIButton* navBackBtn;     // 导航返回button

@property (nonatomic, strong) NSMutableArray* notificationArray;    // 通知
@property (nonatomic, strong) NSMutableArray* frameArray;           // rect

@property (nonatomic, strong) NSString *equipmentSupport;//设备是否支持指纹解锁（no:不支持）
@property (nonatomic, strong) NSString *equipmentSet;//指纹是否设置

- (void)doBack:(id)sender; //导航返回方法
- (void)addCustomNavBack;  //自定义导航返回

#pragma mark 视图、模型、事件生命周期方法
- (void)createFields;
- (void)destroyFields;

- (void)createEvents;
- (void)destroyEvents;

- (void)createViews;
- (void)destroyViews;

- (void)loadData;


#pragma mark 自定义导航方法
- (void)addBackBarButtonItem;

- (void)addNormalBackButton;

- (void)setNavBarTintColor:(UIColor*)color;

- (void)setNavBarHidden:(BOOL)hidden;


#pragma mark 初始化tableview方法
- (UITableView *)createTableViewInTarget:(id)target tableViewStyle:(UITableViewStyle)style hasTabBar:(BOOL)hasTabBar;

- (void)showNullViewWithImage:(NSString *)imageName content:(NSString *)content hasTabBar:(BOOL)hasTabBar;

- (void)hideNullView;

- (void)updateWhenDidAppearHandler;


//注册成功提示界面显示
- (void)showRegisterSuccessView;

//显示提示信息（加载中的）
- (void)showVerificationView:(NSString*)msgStr;
//登录接口  获取登录信息
- (void)loginButtonClickEvent:(id)gesturePasswordVC;


@end
