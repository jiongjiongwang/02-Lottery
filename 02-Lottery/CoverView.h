//
//  CoverView.h
//  02-Lottery
//
//  Created by 王炯 on 16/5/30.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoverViewCloseDelegate.h"


@interface CoverView : UIView

//通过快速加载xib创建CoverView类的类方法
+(instancetype)coverView;

@property (nonatomic,weak)id<CoverViewCloseDelegate> delegate;

@end
