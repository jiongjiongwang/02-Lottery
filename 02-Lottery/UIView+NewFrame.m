//
//  UIView+CZFrame.m
//  彩票01
//
//  Created by 王炯 on 16/4/23.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "UIView+NewFrame.h"

@implementation UIView (CZFrame)

@dynamic wid;
-(CGFloat)wid
{
   return self.frame.size.width;
}
-(void)setWid:(CGFloat)wid
{
    //1.取出控件的frame
    CGRect frame = self.frame;
    //2.修改frame的width值
    frame.size.width= wid;
    //3.frame赋值给控件
    self.frame = frame;
}

@dynamic height;
-(CGFloat)height
{
    return self.frame.size.height;
}
-(void)setHeight:(CGFloat)height
{
    //1.取出控件的frame
    CGRect frame = self.frame;
    //2.修改frame的height值
    frame.size.height= height;
    //3.frame赋值给控件
    self.frame = frame;
}


@dynamic xLocation;
-(CGFloat)xLocation
{
    return self.frame.origin.x;
}
-(void)setXLocation:(CGFloat)xLocation
{
    //1.取出控件的frame
    CGRect frame = self.frame;
    //2.修改frame的x值
    frame.origin.x= xLocation;
    //3.frame赋值给控件
    self.frame = frame;
}

@dynamic yLocation;
-(CGFloat)yLocation
{
    return self.frame.origin.y;
}

-(void)setYLocation:(CGFloat)yLocation
{
    //1.取出控件的frame
    CGRect frame = self.frame;
    //2.修改frame的y值
    frame.origin.y = yLocation;
    //3.frame赋值给控件
    self.frame = frame;
}


@end
