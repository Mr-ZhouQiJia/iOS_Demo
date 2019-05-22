//
//  ViewController.m
//  DataPersistence
//
//  Created by ddsc on 2019/5/20.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import "ViewController.h"
#import "PlistDemo.h"
#import "NSUserDefalutsVC.h"
#import "NSKeyedArchiverVC.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"数据持久化";
    self.dataArray = @[@"plist文件",@"perference偏好设置",@"归档",@"SQLite3",@"FMDB",@"CoreData"];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark ----UITableViewDelegate-----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            PlistDemo *plistVC = [[PlistDemo alloc]init];
            plistVC.title = _dataArray[indexPath.row];
            [self.navigationController pushViewController:plistVC animated:YES];
        }
            break;
        case 1:{
            NSUserDefalutsVC *vc = [[NSUserDefalutsVC alloc]init];
            vc.title = _dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            NSKeyedArchiverVC *vc = [[NSKeyedArchiverVC alloc]init];
            vc.title = _dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
            
        default:
            break;
    }
}

@end
