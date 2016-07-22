//
//  DownloadProgressView.m
//  Demo大合集
//
//  Created by Lin on 16/7/22.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "DownloadProgressView.h"

@interface DownloadProgressView ()

@property (nonatomic, strong) CALayer *progressLayer;
@property (nonatomic, assign) CGFloat currentViewWidth;

@end

@implementation DownloadProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.progressLayer = [CALayer layer];
        self.progressLayer.frame = CGRectMake(0, 0, 0, frame.size.height);
        self.progressLayer.backgroundColor = [UIColor redColor].CGColor;
        [self.layer addSublayer:self.progressLayer];
        
        //存储当前view的宽度值
        self.currentViewWidth = frame.size.width;
    }
    return self;
}

@synthesize progress = _progress;
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    if (progress <= 0) {
        self.progressLayer.frame = CGRectMake(0, 0, 0, self.frame.size.height);
    } else if (progress <= 1) {
        self.progressLayer.frame = CGRectMake(0, 0, self.currentViewWidth * progress, self.frame.size.height);
    } else {
        self.progressLayer.frame = CGRectMake(0, 0, self.currentViewWidth, self.frame.size.height);
    }
}
- (CGFloat)progress {
    return _progress;
}

@synthesize layerColor = _layerColor;
- (void)setLayerColor:(UIColor *)layerColor {
    _layerColor = layerColor;
    self.progressLayer.backgroundColor = layerColor.CGColor;
}
- (UIColor *)layerColor {
    return  _layerColor;
}
@end
