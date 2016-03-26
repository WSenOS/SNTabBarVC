//
//  SNTabBarController.h
//  SNTabBarVC
//
//  Created by wangsen on 16/3/26.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNTabBarController : UITabBarController
/*
 * 控制器
 */
@property (nonatomic, strong) NSArray * controllers;
/*
 * 背景色
 */
@property (nonatomic, strong) UIColor * tabBarBgColor;
/*
 * item正常色
 */
@property (nonatomic, strong) UIColor * normalItemColor;
/*
 * item选中色
 */
@property (nonatomic, strong) UIColor * selectedItemColor;
/*
 * item字体
 */
@property (nonatomic, strong) UIFont * itemFont;
/*
 *  默认选中
 */
@property (nonatomic, assign) NSInteger defaultSelectedIndex;
/*
 * 图片比例
 */
@property (nonatomic, assign) CGFloat itemImageScale;


@end
