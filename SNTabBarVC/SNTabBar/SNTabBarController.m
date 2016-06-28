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
//    [self.tabBar setBackgroundImage:[self createImageWithColor:[UIColor clearColor]]];
//    [self.tabBar setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    [self.tabBar addSubview:self.snTabBar];
}

//颜色转image 可去除边线
- (UIImage*) createImageWithColor: (UIColor*) color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    self.snTabBar.itemImageScale = self.itemImageScale;
    self.snTabBar.tabBarBgColor = self.tabBarBgColor;
    self.snTabBar.normalItemColor = self.normalItemColor;
    self.snTabBar.selectedItemColor = self.selectedItemColor;
    self.snTabBar.itemFont = self.itemFont;
    [viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController * vc = obj;
        UIImage * normalImage = vc.tabBarItem.image;
        UIImage * selectedImage = vc.tabBarItem.selectedImage;
        NSString * title = vc.tabBarItem.title;
        [self.snTabBar sn_addNormalImage:normalImage selectedImage:selectedImage itemTitle:title];
        SNTabBarItem * tabBarItem = (SNTabBarItem *)[self.snTabBar viewWithTag:idx + kItemStartTag];
        tabBarItem.tabBarItem = vc.tabBarItem;
    }];
    self.snTabBar.defaultSelectedIndex = self.defaultSelectedIndex;
    [super setViewControllers:viewControllers];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //清除原有的tabBarItem
    [self removeOriginControls];
}

- (void)removeOriginControls {
    for (id obj in self.tabBar.subviews) {
        if ([obj isKindOfClass:[UIControl class]]) {
            [obj removeFromSuperview];
        }
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    self.snTabBar.selectedItem.selected = NO;
    SNTabBarItem * tabBarItem = self.snTabBar.items[selectedIndex];
    tabBarItem.selected = YES;
    self.snTabBar.selectedItem = tabBarItem;
}

#pragma mark - SNTabBarDelegate
- (BOOL)tabBar:(SNTabBar *)tabBar item:(SNTabBarItem *)tabBarItem selectedIndex:(NSInteger)index {
    if (index == 4) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"" message:@"尚未登录" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
        return NO;
    }
    self.selectedIndex = index;
    return YES;
}

@end
