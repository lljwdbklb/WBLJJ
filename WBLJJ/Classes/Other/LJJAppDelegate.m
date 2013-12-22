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

@implementation LJJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
//    self.window.rootViewController = [[LJJNewfeaturesController alloc]init];
    
    UITabBarController * main = [[LJJMainController alloc]init];
    self.window.rootViewController = main;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
