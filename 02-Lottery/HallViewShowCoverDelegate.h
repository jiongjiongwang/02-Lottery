//
//  HallViewShowCoverDelegate.h
//  02-Lottery
//
//  Created by 王炯 on 16/5/30.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HallViewController;


@protocol HallViewShowCoverDelegate <NSObject>

-(void)HallViewControllerShowCover:(HallViewController *)hallVC;

@end
