//
//  BAHelper.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netdb.h>
#import <arpa/inet.h>
#import <UIKit/UIKit.h>

@interface BAHelper : NSObject
//默认透明度
+ (UIColor *)colorWithHexString:(NSString *)hexColor;
//有alpha的情况
+ (UIColor *)colorWithHexString:(NSString *)hexColor
                          alpha:(CGFloat)alpha;
//设置空间的阴影
+(void)setCustomShadow:(UIView*)view
        andShadowColor:(UIColor*)color
       andShadowOffset:(CGSize)size
      andShadowOpacity:(CGFloat)alpha
       andShadowRadius:(CGFloat)radius;

//时间格式转换
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
                              timeFormat:(BOOL)isHaveMinute;

@end
