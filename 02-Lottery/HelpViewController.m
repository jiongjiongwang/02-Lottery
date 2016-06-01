//
//  HelpViewController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/31.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "HelpViewController.h"
#import "HelpModel.h"
#import "HelpViewCell.h"
#import "WebViewController.h"
#import "MyNavigationController.h"



@interface HelpViewController ()

@property (nonatomic,strong)NSArray *dataArray;

@end

@implementation HelpViewController

static NSString *identify = @"helpCell";

-(NSArray *)dataArray
{
    if (nil == _dataArray)
    {
        //(1)加载文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        //(2)将文件数据转为NSData数据
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        //(3)序列化data数据
        NSArray *tempArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //(4)字典转模型
        NSMutableArray *mutableArray = [NSMutableArray array];
        
        for (NSDictionary *dict in tempArray)
        {
            HelpModel *helpModel = [HelpModel HelpModelWithDict:dict];
            
            [mutableArray addObject:helpModel];
        }
        
        _dataArray = mutableArray;
    }
    
    return _dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[HelpViewCell class] forCellReuseIdentifier:identify];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//实现数据源方法
//(1)列
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//(2)行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
//(3)行数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HelpViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

//(4)实现点击cell时的触发事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //获取点击的当前cell
    HelpViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    WebViewController *webVc = [WebViewController new];
    
    //传递数据
    webVc.model = cell.model;
    
    
    //实例化一个MyNavigationController(点击之后跳转到navigationController）
    MyNavigationController *nav = [[MyNavigationController alloc] initWithRootViewController:webVc];
    
    
    [self presentViewController:nav animated:YES completion:nil];
}


@end
