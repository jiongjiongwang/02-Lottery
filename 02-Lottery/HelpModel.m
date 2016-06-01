//
//  HelpModel.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/31.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "HelpModel.h"

@implementation HelpModel


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.title = dict[@"title"];
        
        self.html = dict[@"html"];
        
        self.ID = dict[@"id"];
    }
    
    return self;
}

+(instancetype)HelpModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}



@end
