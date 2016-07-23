//
//  CircleView.m
//  Demo大合集
//
//  Created by Lin on 16/7/23.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "CircleView.h"

@interface CircleView ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        //创建CAShapeLayer
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = self.bounds;
        
        //创建贝塞尔曲线
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        
        //建立关联
        _shapeLayer.path = path.CGPath;
        
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.lineWidth = 1.f;

        _shapeLayer.strokeEnd = 0.f;
        
        [self.layer addSublayer:_shapeLayer];
    }
    return self;
}

@synthesize startValue = _startValue;
- (void)setStartValue:(CGFloat)startValue {
    _startValue = startValue;
    _shapeLayer.strokeEnd = startValue;
}

@synthesize lineWidth = _lineWidth;
- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    _shapeLayer.lineWidth = lineWidth;
}

@synthesize lineColor = _lineColor;
- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    _shapeLayer.strokeColor = lineColor.CGColor;
}

@synthesize value = _value;
- (void)setValue:(CGFloat )value {
    
    _value = value;
    _shapeLayer.strokeEnd = value;
    
    self.shapeLayer.strokeColor = [UIColor colorWithRed:_value green:_value blue:1.0f alpha:1.0f].CGColor;
}
- (CGFloat)value {
    return _value;
}

@end
