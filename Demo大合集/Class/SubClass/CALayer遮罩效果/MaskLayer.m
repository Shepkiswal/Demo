//
//  MaskLayer.m
//  Demo大合集
//
//  Created by Lin on 16/7/23.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "MaskLayer.h"

@interface MaskLayer ()

@property (nonatomic, strong) CALayer *imageLayer;
@property (nonatomic, strong) CALayer *maskLayer;

@property (nonatomic, strong) UIImage *imageContents;
@property (nonatomic, strong) UIImage *maskContents;
@end

@implementation MaskLayer

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取图片
    self.imageContents = [UIImage imageNamed:@"image.jpg"];
    self.maskContents = [UIImage imageNamed:@"mask"];
    
    //创建imageLayer
    self.imageLayer = [CALayer layer];
    self.imageLayer.frame = [UIScreen mainScreen].bounds;
    self.imageLayer.contents = (__bridge id)(self.imageContents.CGImage);
    [self.view.layer addSublayer:self.imageLayer];
    
    //创建maskLayer
    self.maskLayer = [CALayer layer];
    self.maskLayer.frame = CGRectMake(100, 200, 150, 150);
    self.maskLayer.contents = (__bridge id)(self.maskContents.CGImage);
    
    //添加遮罩
    self.imageLayer.mask = self.maskLayer;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    self.maskLayer.frame = self.imageLayer.bounds;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        self.maskLayer.frame = CGRectMake(100, 200, 150, 150);
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
