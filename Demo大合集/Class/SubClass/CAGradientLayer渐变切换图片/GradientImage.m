//
//  GradientImage.m
//  Demo大合集
//
//  Created by Lin on 16/7/23.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "GradientImage.h"

#define random arc4random() % 256 / 255.0f

@interface GradientImage ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation GradientImage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建imageView
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView1.image = [UIImage imageNamed:@"image.jpg"];
    [self.view addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView2.image = [UIImage imageNamed:@"IMG_1.jpg"];
    [self.view addSubview:imageView2];
    
    //初始化渐变层
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = [UIScreen mainScreen].bounds;
    
    self.gradientLayer.colors = @[(id)[[UIColor clearColor] colorWithAlphaComponent:1.0f].CGColor,
                                  (id)[[UIColor colorWithRed:random
                                                       green:random
                                                        blue:random
                                                       alpha:1.0] colorWithAlphaComponent:0.0f].CGColor];
    
    //设置渐变方向
    self.gradientLayer.startPoint = CGPointZero;
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(layerAnimation) userInfo:nil repeats:YES];
    
    imageView2.layer.mask = self.gradientLayer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //改变分割点
    self.gradientLayer.locations = @[@(1.0f), @(1.0f)];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //改变分割点
    self.gradientLayer.locations = @[@(0.0f), @(0.0f)];
}


- (void)layerAnimation
{

}

@end
