//
//  UINavigationItem+BABarButtonItem.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "UINavigationItem+BABarButtonItem.h"
#import "BABarButtonItem.h"

@implementation UINavigationItem (BABarButtonItem)

#pragma mark - 设置盗号标题、标题颜色
- (void)setNavTitle:(NSString *)title withTitleColor:(UIColor*)titleColor
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 180, 25);
    label.backgroundColor = [UIColor clearColor];
    label.tag = 99901;
    label.font = [UIFont boldSystemFontOfSize:20];
    if (titleColor == nil) {
        label.textColor = [UIColor whiteColor];
    }
    else
    {
        label.textColor = titleColor;
    }
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    self.titleView = label;
}

#pragma mark - 设置导航标题、标题颜色、标题字体大小
- (void)setNavTitle:(NSString *)title withTitleColor:(UIColor*)titleColor withTittleSize:(CGFloat)fontSize{
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 180, 25);
    label.backgroundColor = [UIColor clearColor];
    label.tag = 99901;
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    if (titleColor == nil) {
        label.textColor = [UIColor whiteColor];
    }
    else
    {
        label.textColor = titleColor;
    }
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    self.titleView = label;
    
}

#pragma mark - 设置导航item不同状态图片显示
- (void)setItemWithType:(BANavigationItemType)type
                 target:(id)target
                 action:(SEL)action
            normalImage:(NSString *)nImage
       highlightedImage:(NSString *)hImage
          selectedImage:(NSString *)sImage
{
    BABarButtonItem *buttonItem = [BABarButtonItem buttonItemWithTarget:target
                                                                 action:action
                                                            normalImage:nImage
                                                       highlightedImage:hImage
                                                          selectedImage:sImage];
    UIBarButtonItem *barbuttonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonItem.button];
    NSArray *array = nil;
    if (ISIOS7Later) {
        UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                    target:self
                                                                                    action:nil];
        flexSpacer.width = -10;
        array = @[flexSpacer,barbuttonItem];
        if (type == BANavigationItemTypeleft) {
            [self setLeftBarButtonItems:array];
        }
        else {
            [self setRightBarButtonItems:array];
        }
    }
    else
    {
        if (type == BANavigationItemTypeleft) {
            [self setLeftBarButtonItem:barbuttonItem];
        }
        else {
            [self setRightBarButtonItem:barbuttonItem];
        }
    }
}

#pragma mark - 设置导航item
- (void)setItemWithType:(BANavigationItemType)type
                 target:(id)target
                 action:(SEL)action
                  title:(NSString *)title
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    NSArray *array = nil;
    UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                target:self
                                                                                action:nil];
    flexSpacer.width = 0;
    array = @[flexSpacer,barButtonItem];
    if (type == BANavigationItemTypeleft) {
        [self setLeftBarButtonItems:array];
    }
    else {
        [self setRightBarButtonItems:array];
    }
}

@end
