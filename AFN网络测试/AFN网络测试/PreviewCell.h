//
//  PreviewCell.h
//  AFN网络测试
//
//  Created by WXC on 15/9/1.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CjPreviewGroup.h"

@interface PreviewCell : UITableViewCell
@property (nonatomic, strong) CjPreviewGroup *previewGroup;
/**
 *  通过tableview来创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
