//
//  MyTableViewCell.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/30.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}


//重写time属性，用于更新时间到detailLabel上
-(void)setTime:(NSString *)time
{
    _time = time;
    
    self.detailTextLabel.text = time;
    
}


@end
