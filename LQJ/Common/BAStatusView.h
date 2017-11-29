//
//  BAStatusView.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BAStatusView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *imageView;    // 断网图片
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;     // 断网提示文字
@property (weak, nonatomic) IBOutlet UIView *containerView;     // 容器视图
@property (weak, nonatomic) IBOutlet UIButton *tryButton;

#pragma mark 封装断网提示
- (void)setupWithTargetRect:(CGRect)targetRect image:(NSString *)imageName content:(NSString *)content;
- (void)hide;   // 移除控件

@end
