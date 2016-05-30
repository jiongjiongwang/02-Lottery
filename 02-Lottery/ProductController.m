//
//  ProductController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/30.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "ProductController.h"
#import "ProductModel.h"
#import "ProductCell.h"



@interface ProductController ()

@property (nonatomic,strong)NSArray *dataArray;

@end

@implementation ProductController


static NSString * const reuseIdentifier = @"ProductCell";


//懒加载数据
-(NSArray *)dataArray
{
    if (nil == _dataArray)
    {
#warning 加载json文件的步骤
        //(1)加载文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
        //(2)将文件数据转化为NSData数据
        NSData *data = [NSData dataWithContentsOfFile:path];
        //(3)(序列化)将json数据转化为OC中能够识别的字典或数组
        NSArray *tempArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //(4)字典转模型
        NSMutableArray *mutableArray = [NSMutableArray array];
        
        for (NSDictionary *dict in tempArray)
        {
            ProductModel *productModel = [ProductModel ProductModelWithDict:dict];
            
            [mutableArray addObject:productModel];
        }
        
        _dataArray = mutableArray;
    }
    
    return _dataArray;
}


#warning 在初始化类的时候给类设置流水化布局
-(instancetype)init
{
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    
    //设置item的大小
    flowLayout.itemSize = CGSizeMake(66, 80);
    
    //设置内边距
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 10, 10, 10);
    
    //行间距加大
    flowLayout.minimumLineSpacing = 20;
    
    //列间距加大
    flowLayout.minimumInteritemSpacing = 12;
    
    
    
    
    return [super initWithCollectionViewLayout:flowLayout];
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册cell
    UINib *nib = [UINib nibWithNibName:@"ProductCell" bundle:nil];
    
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    
    
}


//实现数据源方法
//(1)组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//(2)item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


//(3)每一个items的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //设置cell的数据
    cell.model = self.dataArray[indexPath.item];

    return cell;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
