//
//  ColorImageViewController.m
//  Demo大合集
//
//  Created by Lin on 16/7/23.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "ColorImageViewController.h"

#define random arc4random() % 256 / 255.0f

@interface ColorImageViewController ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ColorImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建imageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"image.jpg"];
    [self.view addSubview:imageView];
    
    //初始化渐变层
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = imageView.frame;
    [imageView.layer addSublayer:self.gradientLayer];
    
    //设置渐变方向
    self.gradientLayer.startPoint = CGPointZero;
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    
    //设置颜色组
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,(__bridge id)[UIColor redColor].CGColor];
    //设置颜色分割点
    self.gradientLayer.locations = @[@(0.5f),@(1.0f)];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(layerAnimation) userInfo:nil repeats:YES];
    
}

- (void)layerAnimation
{
    //定时改变颜色
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor colorWithRed:random
                                                               green:random
                                                                blue:random
                                                               alpha:1.0].CGColor];
    
    //定时改变分割点
    self.gradientLayer.locations = @[@(random), @(1.0f)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
