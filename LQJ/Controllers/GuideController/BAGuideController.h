//
//  BAGuideController.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/30.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BABaseViewController.h"

@interface BAGuideController : BABaseViewController<UIScrollViewDelegate>{
    
    UIPageControl *pagectrl;     // 分页
    UIButton *button;            // button
}

@property (nonatomic, strong) UITabBarController *tabBarController;

@end
