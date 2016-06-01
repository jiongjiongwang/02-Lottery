//
//  HelpViewCell.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/31.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "HelpViewCell.h"
#import "HelpModel.h"


@implementation HelpViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

-(void)setModel:(HelpModel *)model
{
    _model = model;
    
    self.textLabel.text = model.title;
}

@end
