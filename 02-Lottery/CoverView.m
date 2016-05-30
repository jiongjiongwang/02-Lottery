//
//  CoverView.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/30.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "CoverView.h"


@interface CoverView()



@end


@implementation CoverView


+(instancetype)coverView
{
#warning 加载xib
    return [[[NSBundle mainBundle] loadNibNamed:@"CoverView" owner:nil options:nil] lastObject];
}



- (IBAction)CloseTheCover:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(CoverViewClose:)])
    {
        [self.delegate CoverViewClose:self];
    }
    
}


@end
