//
//  LJJMoreController.m
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "LJJMoreController.h"

#import "LJJMoveCell.h"
#import "LJJBtn.h"

@interface LJJMoreController ()
@property (strong , nonatomic) NSArray * dataList;
@end

@implementation LJJMoreController

- (id)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    //设置背景颜色
    [self.view setBackgroundColor:kMoreBGColor];
    
    //获取数据
    [self loadMoreData];
    //登出按钮
    [self setupLogout];
}

#pragma mark 
- (void)setupLogout {
    LJJBtn * btn = [[LJJBtn alloc] initWithTitle:@"登出" icon:@"common_button_big_red" highlightedIcon:@"common_button_big_red_highlighted"];
    [btn setBounds:(CGRect){CGPointZero,{0,44}}];
    [btn setContentEdgeInsets:UIEdgeInsetsMake(0, kMargin, 0, kMargin)];
    self.tableView.tableFooterView = btn;
}

#pragma mark - 获取数据
- (void)loadMoreData {
    NSBundle * bundle = [NSBundle mainBundle];
    NSString * path = [bundle pathForResource:@"More" ofType:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:path];
    _dataList = array;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}
#pragma mark - tableview数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  _dataList.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataList[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    LJJMoveCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[LJJMoveCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    NSArray * array =_dataList[indexPath.section];
    if (array.count == 1) {
        [cell setType:kLJJMoveCellOnce];
    } else if(indexPath.row == 0) {
        [cell setType:kLJJMoveCellTop];
    } else if (indexPath.row == array.count - 1){
        [cell setType:kLJJMoveCellBottom];
    } else {
        [cell setType:kLJJMoveCellMiddle];
    }
    
    cell.textLabel.text = array[indexPath.row][@"name"];
    return cell;
}

#pragma mark - tableview代理
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) return 2;
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
