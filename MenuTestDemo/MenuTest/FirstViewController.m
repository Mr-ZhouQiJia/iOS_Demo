//
//  FirstViewController.m
//  MenuTest
//
//  Created by ddsc on 2018/5/21.
//  Copyright © 2018年 ddsc. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstCollectionViewCell.h"
@interface FirstViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation FirstViewController

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"网易新闻";
    [self buildUI];
    self.dataArray = [@[@"推荐",@"热门",@"杭州",@"视频",@"游戏",@"历史",@"图片",@"科技",@"汽车",@"财经",@"军事",@"体育",@"国际"]mutableCopy];
    
}

- (void)buildUI{
    UICollectionViewFlowLayout *layout1 = [[UICollectionViewFlowLayout alloc]init];
    layout1.itemSize =CGSizeMake(50, 30);
    layout1.minimumLineSpacing = 5;
    layout1.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.menuView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, ZZ_WIDTH, 50) collectionViewLayout:layout1];
    [self.view addSubview:_menuView];
    self.menuView.backgroundColor = [UIColor whiteColor];
    self.menuView.delegate = self;
    self.menuView.dataSource = self;
    [self.menuView registerClass:[FirstCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    UICollectionViewFlowLayout *layout2 = [[UICollectionViewFlowLayout alloc]init];
    layout2.itemSize =CGSizeMake(ZZ_WIDTH, ZZ_HEIGHT - 64 - 52);
    layout2.minimumLineSpacing = 1;
    layout2.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.contentView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64 + 52, ZZ_WIDTH, ZZ_HEIGHT - 64 - 52) collectionViewLayout:layout2];
    [self.view addSubview:_contentView];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.delegate = self;
    self.contentView.dataSource = self;
    [self.contentView registerClass:[FirstCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
   // cell.backgroundColor = [UIColor redColor];
    cell.title.text = self.dataArray[indexPath.row];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstCollectionViewCell *cell = (FirstCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.title.textColor = [UIColor redColor];
    cell.title.font = [UIFont systemFontOfSize:19];
    
    if ([collectionView isEqual:self.menuView]) {
        [self.contentView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    FirstCollectionViewCell *cell = (FirstCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.title.textColor = [UIColor blackColor];
    cell.title.font = [UIFont systemFontOfSize:17];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
