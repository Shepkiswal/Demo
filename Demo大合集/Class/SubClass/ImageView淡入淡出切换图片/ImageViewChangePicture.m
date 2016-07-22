//
//  ImageViewChangePicture.m
//  Demo大合集
//
//  Created by Lin on 16/7/22.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "ImageViewChangePicture.h"

@interface ImageViewChangePicture ()

#define ScreenSize [UIScreen mainScreen].bounds.size

@property (nonatomic, strong) CALayer *imageLayer;

@end

@implementation ImageViewChangePicture

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"隐式",@"显式",@"组合"]];
    segment.frame = CGRectMake(0, 0, 100, 30);
    segment.selectedSegmentIndex = 1;
    [segment addTarget:self action:@selector(didClicksegmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:segment];
    
    UIImage *image1 = [UIImage imageNamed:@"IMG_1.jpg"];
    
    self.imageLayer = [CALayer layer];
    self.imageLayer.frame = [UIScreen mainScreen].bounds;
    [self.view.layer addSublayer:self.imageLayer];
    
    self.imageLayer.contents = (__bridge id)(image1.CGImage);
}

- (void)didClicksegmentedControlAction:(UISegmentedControl *)seg{
    NSInteger index = seg.selectedSegmentIndex;
    NSLog(@"%ld",index);

    switch (index) {
        case 0:
            [self layerAnimation1];
            break;
        case 1:
            [self layerAnimation2];
            break;
        case 2:
            [self layerAnimation3];
            break;
        default:
            break;
    }
}

//隐式动画
- (void)layerAnimation1 {
    UIImage *image2 = [UIImage imageNamed:@"IMG_2.jpg"];
    
    self.imageLayer.contents = (__bridge id)(image2.CGImage);

    [self performSelector:@selector(layerAnimation11) withObject:nil afterDelay:1];
}

- (void)layerAnimation11 {
    UIImage *image1 = [UIImage imageNamed:@"IMG_1.jpg"];
    self.imageLayer.contents = (__bridge id)(image1.CGImage);
}

//显式动画
- (void)layerAnimation2 {
    UIImage *image2 = [UIImage imageNamed:@"IMG_2.jpg"];
    
    CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentsAnimation.fromValue = self.imageLayer.contents;
    contentsAnimation.toValue = (__bridge id)(image2.CGImage);
    contentsAnimation.duration = 3.f;
    //需要手动设置，不然会回到之前的状态
//    self.imageLayer.contents = (__bridge id)(image2.CGImage);
    
    [self.imageLayer addAnimation:contentsAnimation forKey:nil];
}

//组合动画
- (void)layerAnimation3 {
    UIImage *image2 = [UIImage imageNamed:@"IMG_2.jpg"];
    //图片动画
    CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentsAnimation.fromValue = self.imageLayer.contents;
    contentsAnimation.toValue = (__bridge id)(image2.CGImage);
    contentsAnimation.duration = 2.f;
    
    //bounds动画
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.fromValue = [NSValue valueWithCGRect:self.imageLayer.bounds];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(100, 100, 90, 160)];
    boundsAnimation.duration = 2.f;
    
    //组合动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[contentsAnimation,boundsAnimation];
    groupAnimation.duration = 2.f;
    
    //需要手动设置，不然会回到之前的状态
//    self.imageLayer.contents = (__bridge id)(image2.CGImage);
//    self.imageLayer.frame = CGRectMake(100, 100, 90, 160);
    
    [self.imageLayer addAnimation:groupAnimation forKey:nil];
}

@end
