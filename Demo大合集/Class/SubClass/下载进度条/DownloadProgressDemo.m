//
//  DownloadProgressDemo.m
//  Demo大合集
//
//  Created by Lin on 16/7/22.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import "DownloadProgressDemo.h"
#import "DownloadProgressView.h"

#define random arc4random() % 30 / 100.f

@interface DownloadProgressDemo ()

@property (nonatomic, strong) DownloadProgressView *progressView;
@property (nonatomic, strong) NSTimer              *timer;

@end

@implementation DownloadProgressDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.progressView = [[DownloadProgressView alloc] initWithFrame:CGRectMake(20, 200, 300, 3)];
    self.progressView.center = self.view.center;
    
    [self.view addSubview:self.progressView];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(layerAnimation) userInfo:nil repeats:YES];
}

//直接修改单独创建的CALayer的属性可以触发隐式动画
- (void)layerAnimation {
//    NSLog(@"隐式动画");
    if (self.progressView.progress == 1.0){
        
        self.progressView.progress = 0.0;
        
    } else {
        
        if ((self.progressView.progress + random) > 1.0) {
            
            self.progressView.progress = 1.0;
        }else {
            
            self.progressView.progress += random;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
