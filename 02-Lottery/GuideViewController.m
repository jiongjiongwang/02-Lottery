//
//  GuideViewController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/31.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "GuideViewController.h"
#import "GuideViewCell.h"


@interface GuideViewController ()

//定义一个数组，存放cell的背景图片
@property (nonatomic,strong)NSArray *imageArray;

@property (nonatomic,weak)UIImageView *lineImage;

@property (nonatomic,weak)UIImageView *ballImage;

@property (nonatomic,weak)UIImageView *LargeTextImage;

@property (nonatomic,weak)UIImageView *smallTextImage;


@end

@implementation GuideViewController


static NSString * const reuseIdentifier = @"Cell";

//懒加载数组
-(NSArray *)imageArray
{
    if (_imageArray == nil)
    {
        _imageArray = @[[UIImage imageNamed:@"guide1Background"],
                        [UIImage imageNamed:@"guide2Background"],
                        [UIImage imageNamed:@"guide3Background"],
                        [UIImage imageNamed:@"guide4Background"],
                        ];
    }
    
    return _imageArray;
}


#warning 重写init方法，初始化流水布局
-(instancetype)init
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置cell的大小
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    
    //修改滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //调整列间距为0
    flowLayout.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:flowLayout];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor greenColor];
    
    //设置分页效果
    self.collectionView.pagingEnabled = YES;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    //去掉弹簧效果
    self.collectionView.bounces = NO;
    
    //在collectionView上添加一些特效图片
    [self setUpUI];
    
    
    [self.collectionView registerClass:[GuideViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

-(void)setUpUI
{
    //(1)添加一个波浪线
    UIImageView *lineImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    
    _lineImage = lineImage;
    
    lineImage.xLocation = -200;
    
    [self.collectionView addSubview:lineImage];
    
    //(2)添加一个足球篮球图片框
    UIImageView *ballImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    
    _ballImage = ballImage;
    
    [self.collectionView addSubview:ballImage];
    
    
    //(3)添加一个大文字
    UIImageView *largeTextImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    
    _LargeTextImage = largeTextImage;
    
    largeTextImage.yLocation = self.collectionView.height*0.7;
    
    [self.collectionView addSubview:largeTextImage];
    
    
    //(4)添加一个小文字
    UIImageView *smallTextImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    
    _smallTextImage = smallTextImage;
    
    
    smallTextImage.yLocation = self.collectionView.height*0.8;
    
    
    [self.collectionView addSubview:smallTextImage];
    
}




//实现数据源代理
//(1)组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//(2)item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}
//(3)item数据
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GuideViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    //设置cell的背景图片
    cell.backgroundView = [[UIImageView alloc] initWithImage:self.imageArray[indexPath.item]];
    
    
    if (indexPath.item == self.imageArray.count - 1)
    {
        cell.hideButton = NO;
    }
    else
    {
        cell.hideButton = YES;
    }
    
    return cell;
}

//滚动collectionView的时候实现代理方法
#warning 当停止减速的时候调用(手动拖拽的时候调用)
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //(1)获取collectionView的x轴偏移量
    CGFloat moveX = scrollView.contentOffset.x;
    
    
    
    //1.1判断扫动的方向
#warning 向右扫动的时候，moveX一直在减少，此时_ballImage.x>moveX
    if (_ballImage.xLocation > moveX)
    {
        //将_ballImage.x先减少一个scrollView的宽度
        _ballImage.xLocation = moveX - scrollView.wid;
    }
#warning 向左扫动时，moveX在增加，此时_ballImage.xLocation < moveX
    else if (_ballImage.xLocation < moveX)
    {
        _ballImage.xLocation = moveX + scrollView.wid;
    }
    
    //(2)修改3张图片显示
    
    //2.1 根据x偏移量来求出索引
    CGFloat index = moveX/scrollView.wid;
    
    //2.2 根据索引来求出图片的字符串
    NSString *ballImageString = [NSString stringWithFormat:@"guide%f",index+1];
    
    NSString *largeImageString = [NSString stringWithFormat:@"guideLargeText%f",index+1];
    
    NSString *smallImageString = [NSString stringWithFormat:@"guideSmallText%f",index+1];
    
    _ballImage.image = [UIImage imageNamed:ballImageString];
    
    _LargeTextImage.image = [UIImage imageNamed:largeImageString];
    
    _smallTextImage.image = [UIImage imageNamed:smallImageString];
    
    
    
    
    //(3)根据偏移量修改3张图片的x轴坐标(带动画)
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _ballImage.xLocation = moveX;
        
        _LargeTextImage.xLocation = moveX;
        
        _smallTextImage.xLocation = moveX;
    }];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
