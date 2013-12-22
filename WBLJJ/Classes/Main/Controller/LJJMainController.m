//
//  LJJMainController.m
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "LJJMainController.h"

#import "LJJHomeController.h"
#import "LJJMoreController.h"

@interface LJJMainController ()

@end

@implementation LJJMainController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupChildControllers];
    //    [self setupItems];
//    [self setSelectedIndex:0];
}
#pragma mark 添加items
- (void)setupChildControllers {
    //首页添加
    UINavigationController * nav1 = [self createWithRootControllerClass:[LJJHomeController class] barItemTitle:@"首页" icon:@"tabbar_home" selectedIcon:@"tabbar_home_selected"];
    //更多
    UINavigationController * nav2 = [self createWithRootControllerClass:[LJJMoreController class] barItemTitle:@"更多" icon:@"tabbar_more" selectedIcon:@"tabbar_more_selected"];
    
    [self setViewControllers:@[nav1,nav2] animated:YES];
}
#pragma mark 创建导航
- (UINavigationController *)createWithRootControllerClass:(Class)controllerClass
                                             barItemTitle:(NSString *)title
                                                     icon:(NSString *)icon
                                             selectedIcon:(NSString *)selectedIcon {
    //首页添加
    UIViewController * class = [[controllerClass alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:class];
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:icon] selectedImage:[UIImage imageNamed:selectedIcon]];
    return nav;
}

@end
