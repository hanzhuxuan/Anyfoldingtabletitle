//
//  PreviewCell.m
//  AFN网络测试
//
//  Created by WXC on 15/9/1.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import "PreviewCell.h"
#import "UIImageView+WebCache.h"

@interface PreviewCell ()
@property (weak, nonatomic) IBOutlet UILabel *ctitle;
@property (weak, nonatomic) IBOutlet UIImageView *themeImg;
@property (weak, nonatomic) IBOutlet UILabel *pubdate;
@property (weak, nonatomic) IBOutlet UILabel *atitle;

@end

@implementation PreviewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    PreviewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PreviewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}



- (void)setPreviewGroup:(CjPreviewGroup *)previewGroup
{
    _previewGroup = previewGroup;
    NSURL *url = [NSURL URLWithString:previewGroup.preview.themeImg];
    self.atitle.text = previewGroup.preview.atitle;
    self.pubdate.text = previewGroup.preview.pubdate;
    [self.themeImg sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    
}

@end
