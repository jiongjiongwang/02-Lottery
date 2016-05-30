//
//  ProductModel.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/30.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
#warning 因为数据中有与属性变量名不同名的元素，不能使用KVC
    if (self = [super init])
    {
        
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.ID = dict[@"id"];
        self.url = dict[@"url"];
        self.icon = dict[@"icon"];
        self.customUrl = dict[@"customUrl"];
    }
    
    return self;
}

+(instancetype)ProductModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
