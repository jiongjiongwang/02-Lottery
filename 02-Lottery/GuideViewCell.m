//
//  GuideViewCell.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/31.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "GuideViewCell.h"
#import "MyTabBarController.h"

@interface GuideViewCell()

@property (nonatomic,weak)UIButton *guideButton;

@end

@implementation GuideViewCell


#warning 当初始化cell时会自动跳转到这里
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //添加一个按钮
        UIButton *guideButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        self.guideButton = guideButton;
        
        //设置button的背景图片
        [guideButton setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        //设置大小自适应
        [guideButton sizeToFit];
        
        //设置button的位置
        guideButton.center = CGPointMake(self.contentView.wid/2,self.contentView.height*0.9);
        
        //添加button的触发事件
        [guideButton addTarget:self action:@selector(ClickButton) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.contentView addSubview:guideButton];
        
    }
    
    return self;
}

-(void)ClickButton
{
#warning 点击进入主界面
    [UIApplication sharedApplication].keyWindow.rootViewController = [[MyTabBarController alloc] init];
    
}

-(void)setHideButton:(BOOL *)hideButton
{
    _hideButton = hideButton;
    
    if (hideButton)
    {
        self.guideButton.hidden = YES;
    }
    else
    {
        self.guideButton.hidden = NO;
    }
}


@end
