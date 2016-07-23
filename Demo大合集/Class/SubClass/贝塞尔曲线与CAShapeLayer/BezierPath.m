//
//  BezierPath.m
//  Demo大合集
//
//  Created by Lin on 16/7/23.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "BezierPath.h"

@interface BezierPath ()

@end

@implementation BezierPath

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建椭圆形贝塞尔曲线
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 100)];
    //矩形
    UIBezierPath *rect = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 200, 100)];
    //圆形
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 200, 200)];
    
    //创建CAShapeLayer
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = CGRectMake(0, 150, 200, 100);
    shape.position = self.view.center;
    
    //显示CAShapeLayer的边界
    shape.borderWidth = 1.f;
    
    //禁止内容显示超出CAShapeLayer的frame值
    shape.masksToBounds = YES;
    
    //修改贝塞尔曲线的填充颜色
    shape.fillColor = [UIColor redColor].CGColor;
    
    //建立连接
    shape.path = circle.CGPath;
    
    [self.view.layer addSublayer:shape];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
