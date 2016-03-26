//
//  SNTabBarController.m
//  SNTabBarVC
//
//  Created by wangsen on 16/3/26.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SNTabBarController.h"
#import "SNTabBarConst.h"
#import "SNTabBar.h"
#import "SNTabBarItem.h"
@interface SNTabBarController () <SNTabBarDelegate>
@property (nonatomic, strong) SNTabBar * snTabBar;
@end

@implementation SNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //图片比例
    self.itemImageScale = 0.7f;
    self.defaultSelectedIndex = 0;
    //创建tabBar
    [self createSNTabBar];
}

- (void)createSNTabBar {
    self.snTabBar = [[SNTabBar alloc] initWithFrame:self.tabBar.bounds];
    self.snTabBar.delegate = self;
    [self.tabBar addSubview:self.snTabBar];
}

- (void)setControllers:(NSArray *)controllers {
    _controllers = controllers;
    //创建tabBa按钮
    [self createSNTabBarItem];
}

- (void)createSNTabBarItem {
    self.snTabBar.itemImageScale = self.itemImageScale;
    self.snTabBar.tabBarBgColor = self.tabBarBgColor;
    self.snTabBar.normalItemColor = self.normalItemColor;
    self.snTabBar.selectedItemColor = self.selectedItemColor;
    self.snTabBar.itemFont = self.itemFont;
    for (UIViewController * vc in _controllers) {
        UIImage * normalImage = vc.tabBarItem.image;
        UIImage * selectedImage = vc.tabBarItem.selectedImage;
        NSString * title = vc.tabBarItem.title;
        [self.snTabBar sn_addNormalImage:normalImage selectedImage:selectedImage itemTitle:title];
    }
    [_controllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController * vc = obj;
        SNTabBarItem * tabBarItem = (SNTabBarItem *)[self.snTabBar viewWithTag:idx + kItemStartTag];
        tabBarItem.tabBarItem = vc.tabBarItem;
    }];
    self.viewControllers = _controllers;
    self.snTabBar.defaultSelectedIndex = self.defaultSelectedIndex;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //清除原有的tabBarItem
    [self removeOriginControls];
}

- (void)removeOriginControls {
    [self.tabBar.subviews enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIControl class]]) {
            [obj removeFromSuperview];
        }
    }];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    self.snTabBar.selectedItem.selected = NO;
    SNTabBarItem * tabBarItem = self.snTabBar.items[selectedIndex];
    tabBarItem.selected = YES;
    self.snTabBar.selectedItem = tabBarItem;
}

#pragma mark - SNTabBarDelegate
- (void)tabBar:(SNTabBar *)tabBar item:(SNTabBarItem *)tabBarItem selectedIndex:(NSInteger)index {
    self.selectedIndex = index;
}

@end
