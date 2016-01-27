//
//  CjPreview.h
//  AFN网络测试
//
//  Created by WXC on 15/9/1.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CjPreview : NSObject

@property (nonatomic, copy) NSString *atitle;
@property (nonatomic, copy) NSString *pubdate;
@property (nonatomic, copy) NSString *themeImg;
@property (nonatomic, copy) NSString *aID;


+ (instancetype)PreviewWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
