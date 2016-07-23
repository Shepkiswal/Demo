//
//  CircleProgressDemo.m
//  Demo大合集
//
//  Created by Lin on 16/7/23.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "CircleProgressDemo.h"
#import "CircleView.h"

#define random arc4random() % 30 / 100.f

@interface CircleProgressDemo ()

@property (nonatomic, strong) CircleView *progressView;

@property (nonatomic, strong) NSTimer              *timer;

@end

@implementation CircleProgressDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.progressView = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];

    self.progressView.lineWidth = 5.f;
    
    self.progressView.center = self.view.center;
    [self.view addSubview:self.progressView];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(layerAnimation) userInfo:nil repeats:YES];
}

- (void)layerAnimation {
    if (self.progressView.value == 1.0){
        
        self.progressView.value = 0.0;
        
    } else {
        
        if ((self.progressView.value + random) > 1.0) {
            
            self.progressView.value = 1.0;
        }else {
            
            self.progressView.value += random;
        }
    }
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
