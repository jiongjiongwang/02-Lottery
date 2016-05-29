//
//  LuckNumController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/28.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "LuckNumController.h"

@interface LuckNumController ()


@property (weak, nonatomic) IBOutlet UIImageView *lightImageView;


@end

@implementation LuckNumController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
#warning 彩灯动画的实现(因为是两个图片之间的切换，所以不需要使用核心动画)
    //(1)设置动画数组
    self.lightImageView.animationImages = @[[UIImage imageNamed:@"lucky_entry_light0" ],[UIImage imageNamed:@"lucky_entry_light1"]];
    
    //(2)设置动画持续时间
    self.lightImageView.animationDuration = 2;
    
    //默认的动画是无限次播放的
    //(3)开始动画
    [self.lightImageView startAnimating];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
