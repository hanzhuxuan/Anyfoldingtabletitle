//
//  PreviewController.m
//  AFN网络测试
//
//  Created by WXC on 15/9/1.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import "PreviewController.h"
#import "CjPreview.h"
#import "PreviewCell.h"
#import "CjPreviewGroup.h"
#import "HeaderView.h"
@interface PreviewController () <HeaderViewDelegate>

@end

@implementation PreviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
     self.tableView.sectionHeaderHeight = 44;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.previews.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CjPreviewGroup *group = self.previews[section];
    return (group.isOpened ? group.previews.count : 0);
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PreviewCell *cell = [PreviewCell cellWithTableView:tableView];
    CjPreviewGroup *group = self.previews[indexPath.section];
    cell.previewGroup = group.previews[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderView *header = [HeaderView headerViewWithTableView:tableView];
    header.delegate = self;
    header.group = self.previews[section];
    
    return header;
}

-(void)headerViewDidClickedNameView:(HeaderView *)headerView
{
    [self.tableView reloadData];
}


@end
