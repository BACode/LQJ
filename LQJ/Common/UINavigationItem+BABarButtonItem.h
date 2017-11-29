//
//  UINavigationItem+BABarButtonItem.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import <UIKit/UIKit.h>

/*   自定义导航左右按钮类型   */
typedef enum {
    
    BANavigationItemTypeleft    = 0,
    BANavigationItemTyperight   = 1
    
}BANavigationItemType;

@interface UINavigationItem (BABarButtonItem)
// 设置导航标题和标题颜色
- (void)setNavTitle:(NSString *)title withTitleColor:(UIColor*)titleColor;

// 设置导航标题、标题颜色、标题文字大小
- (void)setNavTitle:(NSString *)title withTitleColor:(UIColor*)titleColor withTittleSize:(CGFloat)fontSize;

#pragma mark - 封装导航item
- (void)setItemWithType:(BANavigationItemType)type
                 target:(id)target
                 action:(SEL)action
            normalImage:(NSString *)nImage
       highlightedImage:(NSString *)hImage
          selectedImage:(NSString *)sImage;

- (void)setItemWithType:(BANavigationItemType)type
                 target:(id)target
                 action:(SEL)action
                  title:(NSString *)title;

@end
