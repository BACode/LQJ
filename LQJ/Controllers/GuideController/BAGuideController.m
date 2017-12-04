//
//  BAGuideController.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/30.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BAGuideController.h"
#import "BAViewControllerHelper.h"
#import "BASideViewController.h"
#import "BALeftController.h"
@class BASideViewController;
@class BALeftController;

@interface BAGuideController ()

@end

@implementation BAGuideController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(238, 238, 238);
    //创建pageCtrl
    pagectrl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, ScreenHeight-40, ScreenWidth, 40)];
    pagectrl.numberOfPages = 4;
    pagectrl.currentPageIndicatorTintColor = [UIColor redColor];
    pagectrl.pageIndicatorTintColor = [UIColor whiteColor];
    
    //创建按钮
    CGFloat buttonY = (ScreenWidth==414)?(ScreenHeight-60):((ScreenWidth==375)?(ScreenHeight-50):(ScreenHeight-45));
    button = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-120)/2, buttonY, 120, 30)];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setHidden:YES];
    [button setBackgroundImage:[UIImage imageNamed:@"iCon"] forState:UIControlStateNormal];
    
    //将图片存放在数组中
    NSArray *guideImgs = @[@"直播",
                           @"首页",
                           @"数据"];
    
    //创建滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.delegate = self;
    //隐藏滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    //分页效果
    scrollView.pagingEnabled = YES;
    //设置内容尺寸
    scrollView.contentSize = CGSizeMake(ScreenWidth*guideImgs.count, ScreenHeight);
    [self.view addSubview:scrollView];
    //    [self.view addSubview:pagectrl];
    [self.view addSubview:button];
    
    //添加需要显示的图片
    for (int i= 0; i<guideImgs.count; i++) {
        NSString *guideImageName = guideImgs[i];
        
        //创建操作指南图片视图
        UIImageView *guideImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth*i, 0, ScreenWidth, ScreenHeight)];
        guideImageView.image = [UIImage imageNamed:guideImageName];
        [scrollView addSubview:guideImageView];
        //创建进度视图
        
    }
}

//点击事件
- (void)buttonAction:(UIButton *)button{
    
    // 初始化rootController并添加动画效果
    self.tabBarController = [BAViewControllerHelper createTabBarController];
    BALeftController *leftViewController = [[BALeftController alloc] init];
    self.view.window.rootViewController = [[BASideViewController alloc] initWithSideVC:leftViewController currentVC:self.tabBarController];
    //放大动画
    self.tabBarController.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
    //加动画
    [UIView beginAnimations:nil context:nil];
    //时间
    [UIView setAnimationDuration:0.6];
    self.tabBarController.view.transform = CGAffineTransformIdentity;
    
    [UIView commitAnimations];
    
}

#pragma mark  - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    pagectrl.currentPage = scrollView.contentOffset.x/ScreenWidth;
    if (pagectrl.currentPage>1) {
        [button setHidden:NO];
    }else{
        [button setHidden:YES];
    }
    
}

@end
