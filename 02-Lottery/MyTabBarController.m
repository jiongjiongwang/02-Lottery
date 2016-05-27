//
//  MyTabBarController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/27.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "MyTabBarController.h"
#import "TabBottomView.h"


@interface MyTabBarController ()

@property (nonatomic,weak)TabBottomView *bottomView;

//定义一个button，用于记录哪一个button被点击
@property (nonatomic,weak)UIButton *selectedButton;


@end

@implementation MyTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //在这里面初始化5个navigation Controller
    [self setUpNavigationController];
    
    //加载底部工具条
    [self setUpBottomView];
    
    //在底部工具条上添加按钮
    [self setUpButtonsOnBottom];
    
    
}

-(void)setUpNavigationController
{
    //(1)Hall
    UINavigationController *nav1 = [self storyBoardName:@"Hall"];
    
    
    //(2)Arena
    UINavigationController *nav2 = [self storyBoardName:@"Arena"];
    
    
    //(3)Discovery
    UINavigationController *nav3 = [self storyBoardName:@"Discovery"];
    
    //(4)History
    UINavigationController *nav4 = [self storyBoardName:@"History"];
    
    
    //(5)MyLottery
    UINavigationController *nav5 = [self storyBoardName:@"MyLottery"];
    
    
    
    //将5个navigationController添加到tabbarController
    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
    
    
}
//加载底部工具条
-(void)setUpBottomView
{
    //(1)创建
    TabBottomView *bottomView = [[TabBottomView alloc] init];
    
    self.bottomView = bottomView;
    
    //(2)设置
#warning 设置bottomView的frame和tabBar的bounds一样大(因为bottomView最后添加到了tabBar上面了，故为了能遮盖掉tabBar,其坐标值一定是0，故应该取self.tabBar.bounds)
    bottomView.frame = self.tabBar.bounds;

    //(3)添加
    [self.tabBar addSubview:bottomView];

}

-(void)setUpButtonsOnBottom
{
    
#warning 遍历tabBar Controller的子控制器(viewControllers里的内容)，每次遍历一个就在bottomView上添加一个按钮
    //设置button的大小和位置
    CGFloat buttonWidth = self.bottomView.bounds.size.width/self.childViewControllers.count;
    CGFloat buttonHeight = self.bottomView.bounds.size.height;
    CGFloat buttonY = 0;
    
    
    for (int i = 0; i<self.childViewControllers.count; i++)
    {
        CGFloat buttonX = i*buttonWidth;
        
        UIButton *button = [[UIButton alloc]init];
        
        button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
        
        NSString *imageString = [NSString stringWithFormat:@"TabBar%d",i+1];
        
        NSString *selImageString = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        
        
        
        [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:selImageString] forState:UIControlStateSelected];
        
        
        //给button设置tag用于区分点击
        button.tag = i;
        
        //初始化一下
        if (i == 0)
        {
            button.selected = YES;
            _selectedButton = button;
        }
        
        
        //添加button的监听事件
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.bottomView addSubview:button];
    }
    
    
    
}

//button的点击触发事件
-(void)buttonClick:(UIButton *)btn
{
    _selectedButton.selected = NO;
    
    btn.selected = YES;
    
#warning 根据被点击按钮的tag来选择是哪一个NavigationController
    self.selectedIndex = btn.tag;
    
    _selectedButton = btn;
}


#warning 利用5个storyBoard来添加NavigationController
//封装成一个方法，用storyboard名来创建navigationController
-(UINavigationController *)storyBoardName:(NSString *)sbName
{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:sbName bundle:nil];
    
    UINavigationController *nav = [storyBoard instantiateInitialViewController];
    
#warning 设置navigationController第一个viewController的背景色
    nav.topViewController.view.backgroundColor = MyRandomColor;
    
    return nav;
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
