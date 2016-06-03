//
//  AppDelegate.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/27.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"
#import "GuideViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


#warning 根据info.plist文件中的版本号来判断是否是第一次打开
-(BOOL)isNewVersion
{
    //(1)从info.plist文件中获取新的版本号
#warning 获取info字典信息
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    
    NSString *currentVersion = info[@"CFBundleShortVersionString"];
    
    //(2)从偏好中获取旧的版本信息，如果不存在则返回nil
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *oldVersion = [userDefault objectForKey:@"App_Version"];
    
    //(3)判断
    if ([currentVersion isEqualToString:oldVersion])
    {
        return YES;
    }
    else
    {
        //把新版本信息保存
        [userDefault setObject:currentVersion forKey:@"App_Version"];
        
        [userDefault synchronize];
        
        return NO;
    }
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //(1)实例化window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    
    //判断是否要进入新特性界面
    if ([self isNewVersion])
    {
        //(2)实例化一个Tabbar Controller
        MyTabBarController *tabbarVC = [[MyTabBarController alloc] init];
        
        //(3)让Tabbar Controller作为window的主window
        self.window.rootViewController = tabbarVC;
    }
    else
    {
        GuideViewController *guideVC = [[GuideViewController alloc] init];
        
        self.window.rootViewController = guideVC;
    }
    
    
    // 2.3设置状态颜色
    application.statusBarStyle = UIStatusBarStyleLightContent;
    application.statusBarHidden = NO;
    
    
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
