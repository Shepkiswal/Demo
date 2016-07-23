//
//  CircleAnimation.m
//  Demo大合集
//
//  Created by Lin on 16/7/23.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "CircleAnimation.h"

@interface CircleAnimation ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, strong) NSTimer      *timer;

@end

@implementation CircleAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    //创建CAShapeLayer
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 0, 200, 200);
    self.shapeLayer.position = self.view.center;
    
    //填充色为无色，默认为黑色
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    //线条颜色和宽度
    self.shapeLayer.lineWidth = 3.f;
    self.shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0;
    
    //创建出圆形贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    
    //建立联系
    self.shapeLayer.path = circlePath.CGPath;
    
    [self.view.layer addSublayer:self.shapeLayer];
    
    //创建定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.4f target:self selector:@selector(circleAnimationTypeTwo) userInfo:nil repeats:YES];
}

- (void)circleAnimationTypeOne {
    self.shapeLayer.strokeEnd = arc4random() % 101 / 100.f;
}

- (void)circleAnimationTypeTwo {
    CGFloat value1 = arc4random() % 101 / 100.f;
    CGFloat value2 = arc4random() % 101 / 100.f;
    
    self.shapeLayer.strokeStart = value1 < value2 ? value1 : value2;
    self.shapeLayer.strokeEnd = value1 > value2 ? value1 : value2;
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
