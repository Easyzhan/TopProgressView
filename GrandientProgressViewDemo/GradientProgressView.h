//
//  GradientProgressView.h
//  GrandientProgressViewDemo
//
//  Created by Zin_戦 on 15/11/8.
//  Copyright © 2015年 zhan神. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GradientProgressView : UIView {
    
    CALayer *maskLayer;
}

@property (nonatomic, readonly, getter=isAnimating) BOOL animating;
@property (nonatomic, readwrite, assign) CGFloat progress;

- (void)startAnimating;
- (void)stopAnimating;

@end