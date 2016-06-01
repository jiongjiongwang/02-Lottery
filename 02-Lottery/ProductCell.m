//
//  ProductCell.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/30.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "ProductCell.h"

@interface ProductCell()

@property (weak, nonatomic) IBOutlet UIImageView *productImage;

@property (weak, nonatomic) IBOutlet UILabel *productName;


@end



@implementation ProductCell


- (void)awakeFromNib
{
    [super awakeFromNib];
    
#warning 利用Layer图层的方式来裁剪图片圆角
    self.productImage.layer.cornerRadius = 10;
    
    self.productImage.layer.masksToBounds = YES;
    
    
}

//重写model的set方法，获取数据
-(void)setModel:(ProductModel *)model
{
    _model = model;
    
    _productName.text = model.title;
    
    _productImage.image = [UIImage imageNamed:model.icon];
}



@end
