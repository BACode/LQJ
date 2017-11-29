//
//  BABaseViewController.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BABaseViewController.h"
#import "BAHomeController.h"
#import "BALiveStreamController.h"
#import "BAIconController.h"
#import "BACircleController.h"
#import "BADataController.h"
#import "BALoginController.h"

@interface BABaseViewController ()

@end

@implementation BABaseViewController


// 初始化方法
- (id) init {
    self = [super init];
    if (self) {
        //不能在viewDidLoad里面创建,要不然数组重复被创建一直为空
        self.notificationArray = [NSMutableArray array];
        self.frameArray = [NSMutableArray array];
    }
    return self;
}

// 控制器初始化后可调用方法
- (void)InitController {
    [self createFields];    // 初始化model
    [self createViews];     // 初始化view
    [self createEvents];    // 添加事件
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self InitController];
    
    //for iOS7
    if (ISIOS7Later) {
        
        /**
         *  其他UITableView,UIScrollView 位置的
         
         问题多数和这3属性相关。。
         */
        self.edgesForExtendedLayout = UIRectEdgeNone;  //视图不向边缘延伸
        self.automaticallyAdjustsScrollViewInsets = NO;//默认行为
        self.extendedLayoutIncludesOpaqueBars = NO;    //首先看下官方解释，默认 NO， 但是Bar 的默认属性是 透明的。。。也就是说只有在不透明下才有用但是，测试结果很软肋，基本区别不大。。。但是对于解决一些Bug 是还是起作用的，比如说SearchBar的跳动问题
    
    }
    
    [self loadData];
    
    if (!([self isKindOfClass:[BAHomeController class]]||[self isKindOfClass:[BALiveStreamController class]]||[self isKindOfClass:[BAIconController class]]||[self isKindOfClass:[BACircleController class]]||[self isKindOfClass:[BADataController class]])||[self isKindOfClass:[BALoginController class]]) {//4个tarbar和登录页面
        [self addCustomNavBack];
    }
    /**
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasChange:)name:UIKeyboardWillShowNotification object:nil];//键盘显示时发出的通知
     
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:)name:UIKeyboardWillHideNotification object:nil];//键盘显示时发出的通知
     */
    
    //导航栏(1)白色
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"导航栏(1)"]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    
    //加载数据的动画图片
//    [GiFHUD setGifWithImageName:@"pika.gif"];
    
    self.view.backgroundColor = MasterColor;
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
    //隐藏底部tabBar
    if (![self.rdv_tabBarController isTabBarHidden]) {
        [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //隐藏 加载数据动画
//    [GiFHUD dismiss];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [self destroyEvents];
}

// 控制器释放方法
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
    
}

// 导航返回方法
- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

// 自定义导航
- (void)addCustomNavBack{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui_03"]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(doBack:)];
}

#pragma mark - 数据创建和清空方法
- (void)createFields {
    
}

- (void)destroyFields {
    
}

#pragma mark - 视图创建和销毁方法
- (void)createViews {
    
}

- (void)destroyViews {
    
}

#pragma mark - 事件流创建和结束方法
- (void)createEvents {
    
}

- (void)destroyEvents {
    
}

// 加载数据
- (void)loadData {
    
}

// 更新signStrem
- (void)updateWhenDidAppearHandler
{
    
}


// 添加正常返回方法
- (void)addNormalBackButton
{
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] init];
    backItem.title=@"返回";
    backItem.tintColor = MasterColor;
    self.navigationItem.backBarButtonItem = backItem;
}

// 添加导航返回item
- (void)addBackBarButtonItem
{
    [self.navigationItem setItemWithType:BANavigationItemTypeleft
                                  target:self
                                  action:@selector(backToPreViewController:)
                             normalImage:@"barItem_return_n"
                        highlightedImage:@"barItem_return_s"
                           selectedImage:@"barItem_return_s"];
}

// 设置navbar颜色
- (void)setNavBarTintColor:(UIColor*)color
{
    if(ISIOS7Later){
        [self.navigationController.navigationBar setBarTintColor:color];
    }
    else {
        [self.navigationController.navigationBar setTintColor:color];
    }
}

// 隐藏NavBar
- (void)setNavBarHidden:(BOOL)hidden {
    self.navigationController.navigationBar.hidden = hidden;
}

// 导航pop
- (void)backToPreViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

// 初始化tableview
- (UITableView *)createTableViewInTarget:(id)target tableViewStyle:(UITableViewStyle)style hasTabBar:(BOOL)hasTabBar
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:Rect(0, 0, ScreenWidth, ScreenHeight-ViewCtrlTopBarHeight-(hasTabBar?TabBarHeight:0))
                                                          style:style];
    
    // 设置table代理和数据源
    tableView.delegate = target;
    tableView.dataSource = target;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 设置方向和背景颜色
    tableView.showsVerticalScrollIndicator = YES;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.backgroundColor = [UIColor clearColor];
    
    return tableView;
}

// 封装断网提示显示内容
- (void)showNullViewWithImage:(NSString *)imageName content:(NSString *)content hasTabBar:(BOOL)hasTabBar
{
    // 判断statusView的frame
    CGRect rect = CGRectNull;
    if (_tableView) {
        rect = _tableView.frame;
    }
    else
    {
        rect = Rect(0, 0, ScreenWidth, ScreenHeight-ViewCtrlTopBarHeight-(hasTabBar?TabBarHeight:0));
    }
    
    self.statusView = [[Bundle loadNibNamed:@"BAStatusView" owner:self options:nil] lastObject];
    self.statusView.backgroundColor = [UIColor whiteColor];
    [self.statusView.tryButton addTarget:self action:@selector(requestAgain:) forControlEvents:UIControlEventTouchUpInside];
    [self.statusView setupWithTargetRect:rect image:imageName content:content];
    [self.view addSubview:self.statusView];
}

// 隐藏statusView
- (void)hideNullView
{
    if (self.statusView) {
        [self.statusView hide];
    }
}

- (void)requestAgain:(UIButton *)button{
    
    self.requestAgainBlock();
}


#pragma mark -
#pragma mark 通知
//键盘即将显示时发出的通知
- (void)keyboardWasChange:(NSNotification *)aNotification {
    
    NSDictionary *info = [aNotification userInfo];//获取键盘信息
    
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//获取键盘的尺寸
    
    
    [self.frameArray removeAllObjects];//将放frame的数组清空防止出现崩溃
    CGRect  frame2 = Rect(0, 0, 0, 0);
    if (self.notificationArray.count > 0) {//数组里的元素不为0
        
        UIView *btn = nil;
        for (int i = 0; i < self.notificationArray.count; i++) {
            /*遍历数组里的元素,确保每个元素都随键盘显示或隐藏而改变frame*/
            
            btn = self.notificationArray[i];
            frame2 = btn.superview.frame;
            NSLog(@"2222----%@",NSStringFromCGRect(frame2));
            
            NSString *str = NSStringFromCGRect(btn.superview.frame);
            [self.frameArray addObject:str];//将frame信息写成字符串放入数组
            
            NSInteger navigationHeight = self.navigationController.navigationBarHidden?0:64;//判断是否有导航,设定原点坐标
            
            [UIView animateWithDuration:0.25 animations:^{
                btn.superview.frame = CGRectMake(frame2.origin.x, ScreenHeight - kbSize.height-frame2.size.height-frame2.origin.y + navigationHeight, frame2.size.width, frame2.size.height);
                //开启动画,实现控件位移
            }];
        }
        
    }
    
}

// 键盘即将隐藏时发出的通知
- (void)keyboardWillHideNotification:(NSNotification *)aNotification{
    
    CGRect  frame2 = Rect(0, 0, 0, 0);
    
    if (self.notificationArray.count > 0) {
        
        UIView *btn = nil;
        /*遍历数组里的元素,确保每个元素都随键盘显示或隐藏而改变frame*/
        for (int i = 0; i < self.frameArray.count; i++) {
            btn = self.notificationArray[i];
            NSString *str = self.frameArray[i];
            frame2 = CGRectFromString(str) ;//从数组里取出frame转化成的字符串继而转化为frame
            
            [UIView animateWithDuration:0.25 animations:^{
                btn.superview.frame = frame2;
                //开启动画,实现控件位移
            }];
        }
        
    }
    
}

//- (void)showLoginUI{
//    [[GCDQueue mainQueue] queueBlock:^{
//        [self showLoginUI1];
//    } afterDelay:.5f];
//}


//登录接口  获取登录信息
//- (void)loginButtonClickEvent:(id)gesturePasswordVC
//{
//
//    //检查网络
//    if (![RDInputValidator connectedToNetwork]) {
//        [RDHUD addHUDInView:SharedApplication.keyWindow text:NetworkConnectionMsg hideAfterDelay:1];
//        return;
//    }
//
//    NSString *userMobil = [[NSUserDefaults standardUserDefaults] objectForKey:@"userMobil"];
//    NSString *userPassword = [[NSUserDefaults standardUserDefaults] objectForKey:@"userPassword"];
//    NSDictionary *parameters =  @{
//                                  @"mobile":userMobil?userMobil:@"",
//                                  @"password":userPassword?userPassword:@""
//                                  };
//    NSData* body = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
//    [[ApiClient_jintoushou instance] requestDataPath:@"/gateway/user/login" headerDic:nil body:body completionBlock:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"Response object: %@" , response);
//        NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
//
//        //打印应答中的body
//        NSLog(@"Response body: %@" , bodyString);
//
//        NSData * bodyData = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:bodyData options:NSJSONReadingMutableLeaves error:nil];
//
//        NSLog(@"Response jsonDict: %@" , jsonDict);
//        if (jsonDict && [jsonDict isKindOfClass:[NSDictionary class]]){
//            if ([[jsonDict objectForKey:@"success"] boolValue]) {
//                NSString * loginTime = [UserDefaults objectForKey:@"LoginSystemTime"]?:@"";
//                BOOL r = [RDInputValidator compareDate:[NSString stringWithFormat:@"%@",loginTime]];
//                //判断上一次登录时间是否为今天
//                if (!r) {
//                    //上一次登录时间不是今天 （即此次是第一次登录）
//                    [UserDefaults setBool:NO forKey:@"firstShowToday"];
//                }
//
//                [UserDefaults setObject:[NSString stringWithFormat:@"%@",[jsonDict objectForKey:@"systemTime"]] forKey:@"LoginSystemTime"];
//                //                BOOL r = [RDInputValidator compareDate:[NSString stringWithFormat:@"%@",[jsonDict objectForKey:@"systemTime"]]];
//                NSLog(@"r ==%hhd",r);
//                //                [UserDefaults setBool:r forKey:@"timeIsToday"];
//                [UserDefaults synchronize];
//
//                //登录成功
//                [JTSUserInfo setLogin:YES];
//
//                NSDictionary *dataDic = [jsonDict objectForKey:@"data"];
//                NSDictionary *tokenVODic = [dataDic objectForKey:@"tokenVO"];
//                NSDictionary *userInfoVODic = [dataDic objectForKey:@"userInfoVO"];
//                //                NSDictionary *userAccountInfoVODic = [dataDic objectForKey:@"userAccountInfoVO"];
//
//                //把用户id、手机号、token缓存到本地
//                NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//                if (![userInfoVODic isEqual:[NSNull null]]) {
//                    if ([[userInfoVODic objectForKey:@"id"] isEqual:[NSNull null]]) {
//                        [user setObject:@"" forKey:@"userId"];
//                    }else{
//                        [user setObject:[userInfoVODic objectForKey:@"id"] forKey:@"userId"];
//                    }
//                }
//                [user setObject:[userInfoVODic objectForKey:@"mixMobile"] forKey:@"mixMobile"];//加星手机号
//                [user setObject:[userInfoVODic objectForKey:@"riskRating"]?:@"" forKey:@"riskRating"];//分先测评
//                [user setObject:[userInfoVODic objectForKey:@"isOverdue"]?:@"" forKey:@"isOverdue"];//测评是否过期
//
//                //                [user setObject:[userInfoVODic objectForKey:@"open"]?:@"" forKey:@"open"];//是否开户
//                [user setBool:[[userInfoVODic objectForKey:@"open"] boolValue] forKey:@"open"];//是否开户
//
//                [user setObject:[userInfoVODic objectForKey:@"userChannelType"]?:@"" forKey:@"userChannelType"];//用户渠道类型
//
//                //                if (![userAccountInfoVODic isEqual:[NSNull null]]) {
//                //                    [user setObject:[userAccountInfoVODic objectForKey:@"bindSerialNo"] forKey:@"bindSerialNo"];//绑定协议号,不为空 代表已经开通存管帐号
//                //                }
//                [user setObject:[tokenVODic objectForKey:@"token"] forKey:@"token"];
//                [user setObject:[tokenVODic objectForKey:@"ticket"] forKey:@"ticket"];
//                [user setObject:[tokenVODic objectForKey:@"expTime"] forKey:@"expTime"];
//                [user setObject:[tokenVODic objectForKey:@"genTime"] forKey:@"genTime"];
//                [user setObject:bodyData forKey:@"bodyData"];
//                [user setObject:bodyData forKey:@"bodyString"];
//                [user synchronize];
//
//                //需要存渠道信息
//
//                if ([userInfoVODic objectForKey:@"id"]) {
//                    [UMessage setAlias:[userInfoVODic objectForKey:@"id"] type:@"userId" response:^(id responseObject, NSError *error) {
//                    }];
//
//                }
//
//                [gesturePasswordVC hide];
//
//                if (self.baseComletionBlock) {
//                    self.baseComletionBlock(JTSReturnTypeLoginSuccess);
//                }else{
//                    //每天第一次登录成功 要显示引导开户的提示的弹窗
//                    //                    BOOL timeIsToday = [UserDefaults boolForKey:@"timeIsToday"];//今天登录成功
//                    BOOL firstShowToday = [UserDefaults boolForKey:@"firstShowToday"];//今天第一次登录成功
//                    BOOL isOpen = [UserDefaults boolForKey:@"open"];//是否开户
//
//                    //                    if (timeIsToday && firstShowToday ==NO && isOpen ==NO)
//                    if (firstShowToday ==NO && isOpen ==NO){
//                        [[GCDQueue mainQueue] queueBlock:^{
//                            //加载注册成功提示
//                            [self showRegisterSuccessView];
//
//                            [UserDefaults setBool:YES forKey:@"firstShowToday"];
//                            [UserDefaults synchronize];
//                        } afterDelay:.5f];
//                    }
//                }
//
//            }else{
//                //登录失败
//                [RDHUD addHUDInView:SharedApplication.keyWindow text:[NSString stringWithFormat:@"登录失败:%@",[jsonDict objectForKey:@"resultMsg"]] hideAfterDelay:2.0f];
//            }
//        }else{
//            [RDHUD addHUDInView:SharedApplication.keyWindow text:NetworkMsg hideAfterDelay:2.0f];
//        }
//
//    }];
//
//}

//设置行间距
- (NSMutableAttributedString *)setParagraphStyle:(NSString*)string lineSpacing:(CGFloat)lineSpacing{
    //设置行间距
    NSMutableAttributedString *attributes = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    [attributes addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];

    return attributes;
}

//隐藏提示信息（加载中的）
//- (void)hideVerificationView{
//    [verificationView hide];
//}

@end
