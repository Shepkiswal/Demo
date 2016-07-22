//
//  XYLTableViewController.m
//  Demo大合集
//
//  Created by Lin on 16/7/22.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "XYLTableViewController.h"
#define TABLE_CELL_ID @"cellId"

@interface XYLTableViewController ()

{
    NSArray *_titleArray;
    NSArray *_controllerArray;
}

@end

@implementation XYLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"目录";
    
    //创建数据源数组
    [self createDataSource];
    
}

#pragma mark - Create DataSource

- (void)createDataSource {
    
    _titleArray = @[@"下载进度条控件",@"ImageView淡入淡出切换图片"];
    
    _controllerArray = @[@"DownloadProgressDemo",@"ImageViewChangePicture"];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_CELL_ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_CELL_ID];
    }

    cell.textLabel.text = _titleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //通过类名得到类，并创建对象
    Class class = NSClassFromString(_controllerArray[indexPath.row]);
    
    id vc = [[class alloc] init];
    
    [vc setValue:_titleArray[indexPath.row] forKey:@"title"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
