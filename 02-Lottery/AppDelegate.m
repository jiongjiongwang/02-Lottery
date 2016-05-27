//
//  AppDelegate.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/27.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //(1)实例化window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //(2)实例化一个Tabbar Controller
    MyTabBarController *tabbarVC = [[MyTabBarController alloc] init];
    
    
    //(3)让Tabbar Controller作为window的主window
    self.window.rootViewController = tabbarVC;
    
    
    //(4)window显示出来
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
   
}

@end
