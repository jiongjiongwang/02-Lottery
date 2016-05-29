//
//  AllLotteryButton.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/28.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "AllLotteryButton.h"

@implementation AllLotteryButton



#warning 重写layoutSubviews方法让image在右边，text在左边
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //重新设置text的CGPoint
    CGFloat textX = 0;
    CGFloat textY = 0;
    
    
    self.titleLabel.frame = CGRectMake(textX, textY, self.titleLabel.wid, self.titleLabel.height);
    
    
    //重新设置image的frame
    CGFloat imageX = self.titleLabel.wid;
    CGFloat imageY = textY;
    
    self.imageView.frame = CGRectMake(imageX, imageY, self.imageView.wid, self.imageView.height);
}



@end
