//
//  BANavigationController.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BANavigationController : UINavigationController<UIGestureRecognizerDelegate>

@property (nonatomic,assign) BOOL canDragBack;

@end
