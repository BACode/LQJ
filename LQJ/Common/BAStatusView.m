//
//  BAStatusView.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BAStatusView.h"
#import "Macro.h"

@interface BAStatusView ()

@property (nonatomic, assign) CGRect targetRect;

@end


@implementation BAStatusView

// 释放控制器方法
- (void)dealloc
{
    NSLog(@"BAStatusView dealloc");
}

// 初始化方法
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// 更新frame方法
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.frame = _targetRect;
    self.tryButton.layer.cornerRadius = 16;
    [self.tryButton.layer setMasksToBounds:YES];
    self.tryButton.layer.borderColor = MasterColor.CGColor;
    self.tryButton.layer.borderWidth = 1;
    
}

- (void)setupWithTargetRect:(CGRect)targetRect image:(NSString *)imageName content:(NSString *)content
{
    self.targetRect = targetRect;
    [_imageView setImage:[UIImage imageNamed:imageName]];
    _contentLabel.text = content;
}

// 移除控件
- (void)hide
{
    if (self.superview!=nil) {
        [self removeFromSuperview];
    }
}

@end
