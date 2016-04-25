//
//  SNTabBar.m
//  SNTabBarVC
//
//  Created by wangsen on 16/3/26.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SNTabBar.h"
#import "SNTabBarConst.h"
#import "SNTabBarItem.h"
@interface SNTabBar ()
{
    CGRect t_frame;
}
@end
@implementation SNTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kRGBColor(39, 35, 46);
        t_frame = frame;
    }
    return self;
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (UIFont *)itemFont {
    if (!_itemFont) {
        _itemFont = kItemTitleFont;
    }
    return _itemFont;
}

- (UIColor *)normalItemColor {
    if (!_normalItemColor) {
        _normalItemColor = kRGBColor(143, 149, 147);
    }
    return _normalItemColor;
}

- (UIColor *)selectedItemColor {
    if (!_selectedItemColor) {
        _selectedItemColor = [UIColor whiteColor];
    }
    return _selectedItemColor;
}

- (void)setTabBarBgColor:(UIColor *)tabBarBgColor {
    _tabBarBgColor = tabBarBgColor;
    self.backgroundColor = tabBarBgColor;
}

- (void)sn_addNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selcetedImage itemTitle:(NSString *)title {
    SNTabBarItem * tabBarItem = [SNTabBarItem buttonWithType:UIButtonTypeCustom];
    [tabBarItem setImage:normalImage forState:UIControlStateNormal];
    [tabBarItem setImage:selcetedImage forState:UIControlStateSelected];
    [tabBarItem setTitle:title forState:UIControlStateNormal];
    [tabBarItem setTitleColor:self.selectedItemColor forState:UIControlStateSelected];
    [tabBarItem setTitleColor:self.normalItemColor forState:UIControlStateNormal];
    tabBarItem.titleLabel.font = self.itemFont;
    tabBarItem.titleLabel.textAlignment = NSTextAlignmentCenter;
    tabBarItem.itemImageScale = self.itemImageScale;
    //点击事件
    [tabBarItem addTarget:self action:@selector(tabBarItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tabBarItem];
    [self.items addObject:tabBarItem];
    //设置坐标
    NSInteger count = self.subviews.count;
    for (NSInteger i = 0; i < count; i++) {
        SNTabBarItem * item = self.subviews[i];
        item.frame = CGRectMake(0 + (t_frame.size.width / count) * i, 0, (t_frame.size.width / count), t_frame.size.height);
        item.tag = kItemStartTag + i;
    }
}

- (void)tabBarItemClick:(SNTabBarItem *)item {
    BOOL isSelected = NO;
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:item:selectedIndex:)]) {
        isSelected = [_delegate tabBar:self item:item selectedIndex:item.tag - kItemStartTag];
    }
    if (isSelected) {
        _selectedItem.selected = NO;
        item.selected = YES;
        _selectedItem = item;
    }
}

- (void)setDefaultSelectedIndex:(NSInteger)defaultSelectedIndex {
    _defaultSelectedIndex = defaultSelectedIndex;
    SNTabBarItem * defauleSelectedItem = [self viewWithTag:kItemStartTag + defaultSelectedIndex];
    [self tabBarItemClick:defauleSelectedItem];
}

@end
