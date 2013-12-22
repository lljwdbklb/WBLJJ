//
//  LJJAppDelegate.m
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "LJJAppDelegate.h"

#import "LJJNewfeaturesController.h"
#import "LJJMainController.h"
#import "LJJHomeController.h"

#define kVersionKey @"version"

@implementation LJJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //获取配置文件的版本号
    NSString * bundleVersion = [NSBundle mainBundle].infoDictionary[(NSString *)kCFBundleVersionKey];
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    //从偏好设置里去取出版本号
    NSString * version = [userDefaults stringForKey:kVersionKey];
    
    //判断版本号，来确定是否是第一次登陆
//    if ([bundleVersion isEqualToString:version]) {//不是第一次登陆，跳转到主界面
//        UITabBarController * main = [[LJJMainController alloc]init];
//        self.window.rootViewController = main;
//    } else {//第一次登陆，跳转到新特性界面
        self.window.rootViewController = [[LJJNewfeaturesController alloc]init];
        //保存到偏好设置中
//        [userDefaults setObject:bundleVersion forKey:kVersionKey];
//        [userDefaults synchronize];
//    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
