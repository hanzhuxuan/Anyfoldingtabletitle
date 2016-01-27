//
//  TransformTools.h
//  AFN网络测试
//
//  Created by WXC on 15/9/6.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransformTools : NSObject
@property (nonatomic, strong) NSArray *groupArr;
+ (instancetype)groupWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
