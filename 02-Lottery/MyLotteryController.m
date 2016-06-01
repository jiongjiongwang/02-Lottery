//
//  MyLotteryController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/29.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "MyLotteryController.h"
#import "MainSettingController.h"
#import "HelpViewController.h"



@interface MyLotteryController ()

@end

@implementation MyLotteryController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)ClickToSetting:(UIBarButtonItem *)sender
{
    
    MainSettingController *mainSetting = [[MainSettingController alloc] init];
    
    //设置plistName，加载数据
    mainSetting.plistName = @"SettingMain.plist";
    
    mainSetting.navigationItem.title = @"设置";
    
    mainSetting.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(ClickToQuesition)];
    
    
    [self.navigationController pushViewController:mainSetting animated:YES];
}


-(void)ClickToQuesition
{
    
    HelpViewController *helpSetting = [[HelpViewController alloc] init];
    
    //设置plistName，加载数据
    
    helpSetting.navigationItem.title = @"常见问题";
    
    [self.navigationController pushViewController:helpSetting animated:YES];
    
}




@end
