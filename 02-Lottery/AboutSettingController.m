//
//  AboutSettingController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/30.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "AboutSettingController.h"
#import "AboutView.h"


@interface AboutSettingController ()

@end

@implementation AboutSettingController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AboutView *aboutView = [AboutView aboutView];
    
    //设置headerView
    self.tableView.tableHeaderView = aboutView;
    
    
}

//返回headerView的高度



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
