//
//  SNTabBarItem.h
//  SNTabBarVC
//
//  Created by wangsen on 16/3/26.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNTabBarItem : UIButton
@property (nonatomic, strong) UITabBarItem * tabBarItem;
@property (nonatomic, assign) CGFloat itemImageScale;
@end
