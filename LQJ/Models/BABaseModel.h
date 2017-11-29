//
//  BABaseModel.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/28.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BABaseModel : NSObject

//自定义一个初始化方法
- (id)initWithContentsOfDic:(NSDictionary *)dic;

//创建映射关系
- (NSDictionary *)keyToAtt:(NSDictionary *)dic;

@end
