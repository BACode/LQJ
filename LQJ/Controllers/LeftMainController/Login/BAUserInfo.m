//
//  BAUserInfo.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BAUserInfo.h"

@implementation BAUserInfo

+ (BOOL)isLogin
{
    if ([UserDefaults objectForKey:@"BAUserLogin"]==nil) {
        return NO;
    }
    BOOL flag = [[UserDefaults objectForKey:@"BAUserLogin"] boolValue];
    return flag;
}

+ (void)setLogin:(BOOL)isLogin
{
    [UserDefaults setObject:[NSNumber numberWithBool:isLogin] forKey:@"BAUserLogin"];
}

@end
