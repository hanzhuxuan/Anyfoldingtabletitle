//
//  HeaderView.m
//  AFN网络测试
//
//  Created by JING on 15/9/3.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import "HeaderView.h"
#import "CjPreviewGroup.h"
@interface HeaderView()
@property (nonatomic, weak) UIButton *nameView;
@end

@implementation HeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"header";
    HeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[HeaderView alloc] initWithReuseIdentifier:ID];
    }
    return header;
}
/**
 *  在这个初始化方法中,MJHeaderView的frame\bounds没有值
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 添加子控件
        // 1.添加按钮
        UIButton *nameView = [UIButton buttonWithType:UIButtonTypeCustom];
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        // 设置按钮内部的左边箭头图片
        [nameView setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [nameView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 设置按钮的内容左对齐
        nameView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置按钮的内边距
        //        nameView.imageEdgeInsets
        nameView.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        nameView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [nameView addTarget:self action:@selector(nameViewClick) forControlEvents:UIControlEventTouchUpInside];
        
        // 设置按钮内部的imageView的内容模式为居中
        nameView.imageView.contentMode = UIViewContentModeCenter;
        // 超出边框的内容不需要裁剪
        nameView.imageView.clipsToBounds = NO;
        
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.nameView.frame = self.bounds;
}


- (void)setGroup:(CjPreviewGroup *)group
{
    _group = group;
    
    [self.nameView setTitle:group.ctitle forState:UIControlStateNormal];
}

- (void)nameViewClick
{
    // 1.修改组模型的标记(状态取反)
    self.group.opened = !self.group.isOpened;
    
    // 2.刷新表格
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickedNameView:)]) {
        [self.delegate headerViewDidClickedNameView:self];
    }
}


- (void)didMoveToSuperview
{
    if (self.group.opened) {
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

@end
