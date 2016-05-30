//
//  ProductModel.h
//  02-Lottery
//
//  Created by 王炯 on 16/5/30.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject

@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *stitle;

#warning 没办法声明一个叫id的变量
@property(nonatomic,copy)NSString *ID;

@property(nonatomic,copy)NSString *url;

@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *customUrl;


-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)ProductModelWithDict:(NSDictionary *)dict;



@end
