//
//  TransformTools.m
//  AFN网络测试
//
//  Created by WXC on 15/9/6.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import "TransformTools.h"
#import "CjPreviewGroup.h"
#import "CjPreview.h"

@implementation TransformTools


+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init])
    {
        NSArray *groupArr = nil;;
        
        // 把字典装换为模型
        NSMutableArray *dictArray = [NSMutableArray array];
        
        NSLog(@"~~~~~~~%@",dict[@"content"]);
        
        for (NSDictionary *dic in dict[@"content"])
        {
            CjPreviewGroup *group = [CjPreviewGroup groupWithDict:dic];
            [dictArray addObject:group];
        }
        
        // 去掉重复的标题
        NSMutableArray *titleArray = [NSMutableArray array];
        for (int i = 0; i < dictArray.count; i++)
        {
            CjPreviewGroup *group = dictArray[i];
            if (i == 0) {
                [titleArray addObject:group.ctitle];
            }
            for (int j = 0; j < titleArray.count; j++)
            {
                if ([group.ctitle isEqualToString:titleArray[j]]) break;
                if (j == titleArray.count - 1)
                {
                    [titleArray addObject:group.ctitle];
                }
            }
            
        }
        
        // 把相同标题的全部归类到一起
        NSMutableArray *dictArr = [NSMutableArray array];
        for (int i = 0; i < titleArray.count; i++)
        {
            NSString *title = titleArray[i];
            NSMutableArray *arr = [NSMutableArray array];
            for (CjPreviewGroup *group in dictArray)
            {
                if ([group.ctitle isEqualToString:title])
                {
                    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
                    dict[title] = group;
                    dict[@"ctitle"] = title;
                    [arr addObject:dict];
                }
            }
            [dictArr addObject:arr];
        }
        
        // 再把字典转化为要用的模型数据
        NSMutableArray *groupArray = [NSMutableArray array];
        for (NSArray *arr in dictArr)
        {
            CjPreviewGroup *previewGroup = [CjPreviewGroup groupPreviewsWithArr:arr];
            [groupArray addObject:previewGroup];
        }
        groupArr = groupArray;
        
        self.groupArr = groupArr;
    }
    
    return self;
}
@end
