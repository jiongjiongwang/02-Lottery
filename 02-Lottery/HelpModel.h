//
//  HelpModel.h
//  02-Lottery
//
//  Created by 王炯 on 16/5/31.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelpModel : NSObject

@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *html;
@property (nonatomic,copy)NSString *ID;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)HelpModelWithDict:(NSDictionary *)dict;



@end
