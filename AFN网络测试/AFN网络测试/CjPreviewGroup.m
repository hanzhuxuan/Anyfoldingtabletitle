//
//  CjPreviewGroup.m
//  AFN网络测试
//
//  Created by WXC on 15/9/2.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import "CjPreviewGroup.h"

@implementation CjPreviewGroup

+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 赋值标题
        self.ctitle = dict[@"ctitle"];
        CjPreview *preivew = [CjPreview PreviewWithDict:dict];
        self.preview = preivew;
    }
    return self;
}


+ (instancetype)groupPreviewsWithArr:(NSArray *)arr
{
    return [[self alloc] initPreviewsWithArr:arr];
}


- (instancetype)initPreviewsWithArr:(NSArray *)arr
{
    if (self = [super init])
    {
        NSMutableArray *previewArray = [NSMutableArray array];
        for (NSDictionary *dict in arr)
        {
            self.ctitle = dict[@"ctitle"];
            [previewArray addObject:dict[self.ctitle]];
        }
        self.previews = previewArray;
//        NSLog(@"::::::::::%@",self.previews);
    }
    return self;
 }

@end
