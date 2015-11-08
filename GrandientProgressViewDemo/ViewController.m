//
//  ViewController.m
//  GrandientProgressViewDemo
//
//  Created by Zin_戦 on 15/11/8.
//  Copyright © 2015年 zhan神. All rights reserved.
//

#import "ViewController.h"
#import "GradientProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        CGRect frame = CGRectMake(0, 64.0f, CGRectGetWidth([[self view] bounds]), 10.0f);
        progressView = [[GradientProgressView alloc] initWithFrame:frame];

        [self.view setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:progressView];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    // Starts the moving gradient effect
    [progressView startAnimating];
    
    // Continuously updates the progress value using random values
    [self simulateProgress];
}

- (void)simulateProgress {
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        CGFloat increment = (arc4random() % 5) / 10.0f + 0.1;
        CGFloat progress  = [progressView progress] + increment;
        [progressView setProgress:progress];
        if (progress < 1.0) {
            
            [self simulateProgress];
        }
    });
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}
@end
