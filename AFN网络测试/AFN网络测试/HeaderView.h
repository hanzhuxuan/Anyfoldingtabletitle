//
//  HeaderView.h
//  AFN网络测试
//
//  Created by JING on 15/9/3.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeaderView,CjPreviewGroup;


@protocol HeaderViewDelegate <NSObject>
@optional
- (void)headerViewDidClickedNameView:(HeaderView *)headerView;
@end

@interface HeaderView : UITableViewHeaderFooterView
+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) CjPreviewGroup *group;

@property (nonatomic, weak) id<HeaderViewDelegate> delegate;

@end
