//
//  ArenaController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/28.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "ArenaController.h"

@interface ArenaController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@end

@implementation ArenaController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置控制器的背景图片
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"NLArenaBackground"].CGImage);
    
    //设置导航控制器的背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    
    
#warning 设置segment
    [self.segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [self.segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];

    
    //设置segment标题颜色
    
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    [self.segment setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    //清理segment中间的蓝线
    [self.segment setTintColor:[UIColor clearColor]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
