//
//  AppDelegate.m
//  SNTabBarVC
//
//  Created by wangsen on 16/3/26.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "AppDelegate.h"
#import "SNTabBarController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ViewController1 * vc1 = [[ViewController1 alloc] init];
    vc1.tabBarItem.title = @"vc1";
    vc1.tabBarItem.badgeValue = @"0";
    vc1.tabBarItem.image = [UIImage imageNamed:@"mealDefault"];
    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"mealSelected"];
    
    ViewController2 * vc2 = [[ViewController2 alloc] init];
    vc2.tabBarItem.title = @"vc2";
    vc2.tabBarItem.badgeValue = @"21";
    vc2.tabBarItem.image = [UIImage imageNamed:@"messageDefault"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"messageSelected"];

    ViewController3 * vc3 = [[ViewController3 alloc] init];
    vc3.tabBarItem.title = @"vc3";
    vc3.tabBarItem.badgeValue = @"2";
    vc3.tabBarItem.image = [UIImage imageNamed:@"moneyDefault"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"moneySelected"];

    ViewController4 * vc4 = [[ViewController4 alloc] init];
    vc4.tabBarItem.title = @"vc4";
    vc4.tabBarItem.badgeValue = @"21";
    vc4.tabBarItem.image = [UIImage imageNamed:@"numberDefault"];
    vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"numberSelected"];

    ViewController5 * vc5 = [[ViewController5 alloc] init];
    vc5.tabBarItem.title = @"vc5";
    vc5.tabBarItem.badgeValue = @"99+";
    vc5.tabBarItem.image = [UIImage imageNamed:@"orderDefault"];
    vc5.tabBarItem.selectedImage = [UIImage imageNamed:@"orderSelected"];

    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    UINavigationController * nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    UINavigationController * nav5 = [[UINavigationController alloc] initWithRootViewController:vc5];
    
    SNTabBarController * tabBarController = [[SNTabBarController alloc] init];
    
    tabBarController.itemImageScale = 0.6;
    tabBarController.tabBarBgColor = [UIColor darkGrayColor];
    tabBarController.normalItemColor = [UIColor orangeColor];
    tabBarController.selectedItemColor = [UIColor whiteColor];
    tabBarController.itemFont = [UIFont systemFontOfSize:14];
    tabBarController.defaultSelectedIndex = 0;
    
    tabBarController.controllers = @[nav1,nav2,nav3,nav4,nav5];
    self.window.rootViewController = tabBarController;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        vc1.tabBarItem.badgeValue = @"100000";
        vc5.tabBarItem.badgeValue = @"0";
    });

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
