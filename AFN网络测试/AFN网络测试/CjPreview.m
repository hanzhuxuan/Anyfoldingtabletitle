//
//  CjPreview.m
//  AFN网络测试
//
//  Created by WXC on 15/9/1.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import "CjPreview.h"

@implementation CjPreview

+ (instancetype)PreviewWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.atitle = dict[@"atitle"];
        self.aID = dict[@"aID"];
        self.pubdate = dict[@"pubdate"];
        self.themeImg = dict[@"themeImg"];
    }
    return self;
}

@end
