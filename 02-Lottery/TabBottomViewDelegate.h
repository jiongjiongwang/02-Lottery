//
//  TabBottomViewDelegate.h
//  02-Lottery
//
//  Created by 王炯 on 16/5/27.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TabBottomView;


@protocol TabBottomViewDelegate <NSObject>

-(void)TabBottomView:(TabBottomView *)tabBottomView withButtonTag:(NSInteger)tag;


@end
