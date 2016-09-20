//
//  PopWindow.m
//  LikeAlertView
//
//  Created by yangyu on 15/8/21.
//  Copyright (c) 2015年 YangYiYu. All rights reserved.
//

#import "PopWindow.h"

#define SCREEN_W CGRectGetWidth([[UIScreen mainScreen] bounds])
#define SCREEN_H CGRectGetHeight([[UIScreen mainScreen] bounds])

@interface PopWindow () {
    UIWindow *_popWindow;
}

@end

@implementation PopWindow

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H);
        [self initInterface];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initInterface];
    }
    return self;
}

- (void)initInterface {
    
    //初始化窗口
    _popWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _popWindow.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    //_popWindow.backgroundColor = [UIColor clearColor];
    _popWindow.windowLevel = UIWindowLevelAlert;
    
    //初始化视图
    self.center = CGPointMake(SCREEN_W * 0.5, SCREEN_H * 0.5);
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 0;
    self.backgroundColor = [UIColor clearColor];
    
    [_popWindow addSubview:self];
}

- (void)show {
    [_popWindow makeKeyAndVisible];
}

- (void)hide {
    [self removeFromSuperview];
    _popWindow.alpha = 0;
    [_popWindow resignKeyWindow];
}



@end
