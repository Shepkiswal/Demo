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

    [self createDataSource];
    
}

#pragma mark - Create DataSource

- (void)createDataSource {
    
    _titleArray = @[@"下载进度条(封装)",@"ImageView淡入淡出切换图片",@"CALayer遮罩效果",@"贝塞尔曲线与CAShapeLayer",@"CAShapeLayer圆形动画",@"圆形进度条(封装)",@"CAGradientLayer色差动画",@"CAGradientLayer渐变切换图片",@"波纹进度动画"];
    
    _controllerArray = @[@"DownloadProgressDemo",@"ImageViewChangePicture",@"MaskLayer",@"BezierPath",@"CircleAnimation",@"CircleProgressDemo",@"ColorImageViewController",@"GradientImage",@"CircleWave"];
    
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
    
    UIViewController *vc;
    //通过类名得到类，并创建对象
    if ([_controllerArray[indexPath.row] isEqualToString:@"CircleWave"]) {
        
        vc = [UIStoryboard storyboardWithName:@"CircleWave" bundle:nil].instantiateInitialViewController;
        
    } else {
        
        Class class = NSClassFromString(_controllerArray[indexPath.row]);
        
        vc = [[class alloc] init];

    }
    
    vc.title = _titleArray[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
