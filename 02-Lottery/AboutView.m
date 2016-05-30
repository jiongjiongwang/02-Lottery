//
//  AboutView.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/30.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "AboutView.h"

@implementation AboutView


+(instancetype)aboutView
{
#warning 加载xib
    return [[[NSBundle mainBundle] loadNibNamed:@"AboutView" owner:nil options:nil] lastObject];
}


@end
