//
//  BABarButtonItem.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BABarButtonItem : NSObject

#pragma mark - 自定义tabbar

@property (nonatomic,strong)UIButton *button;       // 按钮
@property (nonatomic,strong)NSString *title;        // 标题
@property (nonatomic,strong)UIFont *font;           // 字体

@property (nonatomic,strong)NSString *normalImage;      // normal状态图片
@property (nonatomic,strong)NSString *highlightedImage; // highlight状态图片
@property (nonatomic,strong)NSString *selectedImage;    // select状态图片


@property (nonatomic,weak)id target;        // 事件
@property (nonatomic,assign)SEL selector;   // 事件触发器


#pragma mark - 封装item
+ (id)buttonItemWithTarget:(id)target
                    action:(SEL)action
               normalImage:(NSString *)nImage
          highlightedImage:(NSString *)hImage
             selectedImage:(NSString *)sImage;

- (void)setTarget:(id)target withAction:(SEL)action;

@end
