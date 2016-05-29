//
//  AllLotteryController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/28.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "AllLotteryController.h"
#import "AllLotteryButton.h"


@interface AllLotteryController ()


@property (nonatomic,weak)UIView *blueView;



@end

@implementation AllLotteryController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *blueView = [[UIView alloc] init];
    
    self.blueView = blueView;
    
    blueView.backgroundColor = MyRandomColor;
    
    blueView.wid = self.view.wid;
    blueView.height = 0;
    blueView.xLocation = 0;
    
#warning y轴坐标 = navaigationController的高度是64
    blueView.yLocation = 64;
    
    
    
    [self.view addSubview:blueView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//给按钮添加触发事件
- (IBAction)BtnClick:(AllLotteryButton *)sender
{
    
    //(1)蓝色的view点击之后出现
    CGFloat height = self.blueView.height;
    
    CGAffineTransform transform;
    
    
    if (height == 0)
    {
        height = 200;
        
        //旋转180度
        transform = CGAffineTransformMakeRotation(M_PI);
        
    }
    else
    {
        height = 0;
        
        //回到原来的角度
       transform = CGAffineTransformIdentity;
        
    }
    
    [UIView animateWithDuration:0.5 animations:^{
       
        self.blueView.height = height;
        
        sender.imageView.transform = transform;
        
        
    }];
   
    
}


@end
