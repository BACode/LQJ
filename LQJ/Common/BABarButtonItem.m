//
//  BABarButtonItem.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BABarButtonItem.h"
#import "Macro.h"

#define ItemWidth  NaviBarHeight    // item宽度
#define ItemHeight NaviBarHeight    // item高度

@implementation BABarButtonItem

// 初始化方法
- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

// 按钮正常状态显示图片
- (void)setNormalImage:(NSString *)normalImage
{
    _normalImage = normalImage;
    [_button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
}

// 按钮高亮状态显示图片
- (void)setHighlightedImage:(NSString *)highlightedImage
{
    _highlightedImage = highlightedImage;
    [_button setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
}

// 按钮选择状态显示图片
- (void)setSelectedImage:(NSString *)selectedImage
{
    _selectedImage = selectedImage;
    [_button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
}

// 设置按钮不同状态显示的图片和点击事件
+ (id)buttonItemWithTarget:(id)target
                    action:(SEL)action
               normalImage:(NSString *)nImage
          highlightedImage:(NSString *)hImage
             selectedImage:(NSString *)sImage
{
    BABarButtonItem *item = [[BABarButtonItem alloc] init];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    item.button  = button;
    button.frame =CGRectMake(0, 0, ItemWidth, ItemHeight);
    item.normalImage = nImage;
    item.highlightedImage = hImage;
    item.selectedImage = sImage;
    [item setTarget:target withAction:action];
    return item;
}

// 按钮点击事件
- (void)setTarget:(id)target withAction:(SEL)action
{
    [_button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
@end
