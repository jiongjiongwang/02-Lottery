//
//  MainSettingController.h
//  02-Lottery
//
//  Created by 王炯 on 16/5/29.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainSettingController : UITableViewController

#warning 一个MainSettingController对应着一个plistName，用于从plist文件中加载相关信息到MainSettingController上
@property (nonatomic,copy)NSString *plistName;


@end
