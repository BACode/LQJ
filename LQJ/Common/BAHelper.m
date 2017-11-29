//
//  BAHelper.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BAHelper.h"

@implementation BAHelper
//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)hexColor
{
    return [self colorWithHexString:hexColor alpha:1.0f];
}

//有alpha的情况
+ (UIColor *)colorWithHexString:(NSString *)hexColor alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

+(void)setCustomShadow:(UIView*)view andShadowColor:(UIColor*)color andShadowOffset:(CGSize)size andShadowOpacity:(CGFloat)alpha andShadowRadius:(CGFloat)radius{
    //设置阴影
    view.layer.shadowColor = color.CGColor;//shadowColor阴影颜色
    view.layer.shadowOffset = size;//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    view.layer.shadowOpacity = alpha;//阴影透明度，默认0
    view.layer.shadowRadius = radius;//阴影半径，默认3
    view.clipsToBounds = false;
}
//时间格式转换
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString timeFormat:(BOOL)isHaveMinute
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    if (isHaveMinute) {
        //包含时分秒
        dateString = [formatter stringFromDate:date];
    }else{
        //不包含时分秒
        dateString=[dateString substringWithRange:NSMakeRange(0,dateString.length-8 )];
    }
    
    return dateString;
}


@end
