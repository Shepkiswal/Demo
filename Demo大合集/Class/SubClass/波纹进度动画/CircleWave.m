//
//  CircleWave.m
//  Demo大合集
//
//  Created by Lin on 16/8/21.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "CircleWave.h"
#import "UIView+SLExtension.h"

@interface CircleWave ()

@property (weak, nonatomic) IBOutlet UIView *bgView1;
@property (weak, nonatomic) IBOutlet UIImageView *CircleView1;
@property (weak, nonatomic) IBOutlet UILabel *ElectricLabel1;
@property (weak, nonatomic) IBOutlet UIView *bgView2;
@property (weak, nonatomic) IBOutlet UIImageView *CircleView2;
@property (weak, nonatomic) IBOutlet UILabel *ElectricLabel2;

@end

@implementation CircleWave

- (void)viewDidLoad {
    [super viewDidLoad];

    [self animation1];
    [self animation2];
}

- (void)animation1 {
    
    CABasicAnimation *basic1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basic1.beginTime = 0;
    basic1.toValue = @(M_PI * 2);
    basic1.duration = 1.5;
    basic1.repeatCount = 2;
    basic1.autoreverses = NO;
    basic1.fillMode = kCAFillModeForwards;
    basic1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    
    [self.CircleView1.layer addAnimation:basic1 forKey:nil];
    self.bgView1.layer.cornerRadius = 115 / 2.0;
    self.bgView1.clipsToBounds = YES;
    
    UIImageView *waveImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave"]];
    waveImageView.frame = CGRectMake(0, 0, 450, 300);
    waveImageView.alpha = 1;
    waveImageView.y = 115;
    waveImageView.x = -300;
    
    [self.bgView1 addSubview:waveImageView];
    
    int electric = arc4random() % 100;
    self.ElectricLabel1.text = [NSString stringWithFormat:@"%d%%",electric];
    [UIView animateWithDuration:3.0 animations:^{
       
        waveImageView.y = 115 - ((electric / 100.0) * 115);
        if (electric == 100) {
            waveImageView.y = -30;
        }
        waveImageView.x = 0;
    }];
    
}

- (void)animation2 {
    
    CABasicAnimation *basic1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basic1.beginTime = 0;
    basic1.toValue = @(M_PI * 2);
    basic1.duration = 1.5;
    basic1.repeatCount = 2;
    basic1.autoreverses = NO;
    basic1.fillMode = kCAFillModeForwards;
    basic1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    
    [self.CircleView2.layer addAnimation:basic1 forKey:nil];
    self.bgView2.layer.cornerRadius = 115 / 2.0;
    self.bgView2.clipsToBounds = YES;
    
    UIImageView *waveImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave"]];
    waveImageView.frame = CGRectMake(0, 0, 450, 300);
    waveImageView.alpha = 1;
    waveImageView.y = 115;
    waveImageView.x = -300;
    
    [self.bgView2 addSubview:waveImageView];
    
    int electric = arc4random() % 100;
    self.ElectricLabel2.text = [NSString stringWithFormat:@"%d%%",electric];
    [UIView animateWithDuration:1.0 animations:^{
        waveImageView.y = 0;
        waveImageView.x = -200;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3.0 animations:^{
            
            waveImageView.y = 115 - ((electric / 100.0) * 115);
            if (electric == 100) {
                waveImageView.y = -30;
            }
            waveImageView.x = 0;
        }];
    }];
    
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
