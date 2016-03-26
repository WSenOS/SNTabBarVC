//
//  UIView+Extension.h
//  wrongTopic
//
//  Created by wangsen on 16/1/15.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
#import <Foundation/Foundation.h>

typedef void(^ExplodeCompletion)(void);

@interface UIView (sn_Extension)

@property (nonatomic, copy) ExplodeCompletion completionCallback;

//爆炸动画
- (void)lp_explode;
- (void)lp_explodeWithCallback:(ExplodeCompletion)callback;

//抖动动画
+ (void)addAnimationRotation:(UIView *)view;
//缩放动画
+ (void)addAnimationScale:(UIView *)view;
//移除动画
+ (void)removeAllAnimations:(UIView *)view;

@end
