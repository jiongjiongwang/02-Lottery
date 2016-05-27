//
//  TabBottomView.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/27.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "TabBottomView.h"

@interface TabBottomView()

//定义一个button，用于记录哪一个button被点击
@property (nonatomic,weak)UIButton *selectedButton;


@end

@implementation TabBottomView

-(void)setUpButtonsOnBottomWithCount:(NSInteger)Count
{
#warning 遍历tabBar Controller的子控制器(viewControllers里的内容)，每次遍历一个就在bottomView上添加一个按钮
    //设置button的大小和位置
    CGFloat buttonWidth = self.bounds.size.width/Count;
    CGFloat buttonHeight = self.bounds.size.height;
    CGFloat buttonY = 0;
    
    
    for (int i = 0; i<Count; i++)
    {
        CGFloat buttonX = i*buttonWidth;
        
        UIButton *button = [[UIButton alloc]init];
        
        button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
        
        NSString *imageString = [NSString stringWithFormat:@"TabBar%d",i+1];
        
        NSString *selImageString = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        
        
        
        [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:selImageString] forState:UIControlStateSelected];
        
        
        //给button设置tag用于区分点击
        button.tag = i;
        
        //初始化一下
        if (i == 0)
        {
            button.selected = YES;
            _selectedButton = button;
        }
        
        
        //添加button的监听事件
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
    }
}

//button的点击触发事件
-(void)buttonClick:(UIButton *)btn
{
    _selectedButton.selected = NO;
    
    btn.selected = YES;
    
    
    //通知代理去做
    if ([self.delegate respondsToSelector:@selector(TabBottomView:withButtonTag:)])
    {
        [self.delegate TabBottomView:self withButtonTag:btn.tag];
    }
    
    
    _selectedButton = btn;
}


@end
