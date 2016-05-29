//
//  MyNavigationController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/28.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController


#warning 初始化方法：系统第一次初始化这个类的时候，调用这个方法(只会调用一次),在这个类中设置导航栏的显示效果
+(void)initialize
{
#warning 通过appearance获取到导航条的外观代理对象
#warning 通过外观代理设置的效果，将应用里面所有通过UINavigationBar创建的对象，设置其外观都一样的
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    /*
     typedef NS_ENUM(NSInteger, UIBarMetrics) 
     {
     UIBarMetricsDefault,   //任何情况下都会显示
     UIBarMetricsCompact,
     UIBarMetricsDefaultPrompt = 101, // Applicable only in bars with the prompt property, such as UINavigationBar and UISearchBar
     UIBarMetricsCompactPrompt,
     
     UIBarMetricsLandscapePhone NS_ENUM_DEPRECATED_IOS(5_0, 8_0, "Use UIBarMetricsCompact instead") = UIBarMetricsCompact,
     UIBarMetricsLandscapePhonePrompt NS_ENUM_DEPRECATED_IOS(7_0, 8_0, "Use UIBarMetricsCompactPrompt") = UIBarMetricsCompactPrompt,
     };
   
     */

    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    
#warning 设置Tabbar的字体颜色为白色
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor]};

    [navBar setTitleTextAttributes:dict];
    
    //设置tabbar上面按钮字体的颜色
    [navBar setTintColor:[UIColor whiteColor]];
    
    
}

#warning 拦截系统的push操作
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
   //隐藏底部的tabBarContller
#warning 需要先作出判断(纯代码写的push操作需要判断)
    if (self.viewControllers.count>0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
