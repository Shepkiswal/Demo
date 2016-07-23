//
//  CircleView.h
//  Demo大合集
//
//  Created by Lin on 16/7/23.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView

//起始值
@property (nonatomic, assign) CGFloat startValue;
//线宽
@property (nonatomic, assign) CGFloat lineWidth;
//线颜色
@property (nonatomic, strong) UIColor *lineColor;
//当前值
@property (nonatomic, assign) CGFloat value;

@end
