//
//  ViewController.m
//  SNTabBarVC
//
//  Created by wangsen on 16/3/26.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    btn1.center = CGPointMake(100, 100);
    [btn1 addTarget:self action:@selector(back1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];

}

- (void)back1 {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)back {
    ViewController * v = [[ViewController alloc] init];
    v.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:v animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
