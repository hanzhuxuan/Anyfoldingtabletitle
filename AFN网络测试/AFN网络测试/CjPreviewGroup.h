//
//  CjPreviewGroup.h
//  AFN网络测试
//
//  Created by WXC on 15/9/2.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CjPreview.h"

@interface CjPreviewGroup : NSObject
@property (nonatomic, strong) CjPreview *preview;
@property (nonatomic, copy) NSString *ctitle;
@property (nonatomic, strong) NSArray *previews;
@property (nonatomic, assign, getter = isOpened) BOOL opened;

+ (instancetype)groupWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)groupPreviewsWithArr:(NSArray *)arr;
- (instancetype)initPreviewsWithArr:(NSArray *)arr;
@end
