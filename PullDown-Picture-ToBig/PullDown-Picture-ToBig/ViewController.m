//
//  ViewController.m
//  PullDown-Picture-ToBig
//
//  Created by ddsc on 2018/5/11.
//  Copyright © 2018年 ddsc. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import <Masonry.h>
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UIView *headerView;
@property (nonatomic,strong)UIImageView *image;
@property (nonatomic,assign)CGFloat height;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
  //  self.tableView.contentInset = UIEdgeInsetsMake(180, 0, 0, 0);
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    self.headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 180)];
    _image = [[UIImageView alloc]init];
    _image.clipsToBounds = YES;
    _image.contentMode = UIViewContentModeScaleAspectFill;
    _image.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
    _image.image = [UIImage imageNamed:@"WechatIMG1.jpeg"];
    _image.alpha = 0.7;
    [self.headerView addSubview:_image];
    self.tableView.tableHeaderView = self.headerView;
    
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.headerView).insets(UIEdgeInsetsMake(15, 15, 15, 15));
    }];
    
  
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.label.text = @"123456789";
    cell.image.image = [UIImage imageNamed:@"WechatIMG1.jpeg"];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat headViewHeight = scrollView.contentOffset.y;
    NSLog(@"height:%lf",headViewHeight);
    /*
    //if (scrollView == self.tableView) {
        if(headViewHeight< -20)
        {
            CGRect frame= self.headerView.frame;
            
            //高
            frame.size.height = 200 + ABS(headViewHeight);
            CGFloat h = 200 + ABS(headViewHeight);
            //宽
            frame.size.width = [UIScreen mainScreen].bounds.size.width * h / 200;
            //x
            
           frame.origin.x = -([[UIScreen mainScreen] bounds].size.width*h/200-[[UIScreen mainScreen] bounds].size.width)/2;
            
            //y
            frame.origin.y = -ABS(headViewHeight);
            
            
            self.headerView.frame=frame;
            
        }else{
            
        }
    //}
    */
    CGFloat yOffset = self.tableView.contentOffset.y;
    //向上偏移量变正  向下偏移量变负
    if (yOffset < -20) {
        CGFloat factor = ABS(yOffset)+200;
        CGRect f = CGRectMake(-([[UIScreen mainScreen] bounds].size.width*factor/200-[[UIScreen mainScreen] bounds].size.width)/2,-ABS(yOffset), [[UIScreen mainScreen] bounds].size.width*factor/200, factor);
        _image.frame = f;
        NSLog(@"%@",NSStringFromCGRect(f));
    }else {
        CGRect f = _headerView.frame;
        f.origin.y = 0;
        _headerView.frame = f;
        _image.frame = CGRectMake(0, f.origin.y, [[UIScreen mainScreen] bounds].size.width, 200);
        NSLog(@"%@",NSStringFromCGRect(f));
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
