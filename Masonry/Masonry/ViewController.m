//
//  ViewController.m
//  Masonry
//
//  Created by ddsc on 2018/5/4.
//  Copyright © 2018年 ddsc. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "Model.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *data;
@end

@implementation ViewController

- (NSMutableArray *)data{
    if (!_data) {
        self.data = [NSMutableArray array];
    }
    return _data;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MyCell class] forCellReuseIdentifier:@"cell"];
    
    Model *model1 = [[Model alloc]init];
    model1.title = @"111111111111";
    model1.content = @".使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致";
    
    Model *model2 = [[Model alloc]init];
    model2.title = @"222222222";
    model2.content = @"使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode ，alignment等等；";
    
    Model *model3 = [[Model alloc]init];
    model3.title = @"333333333";
    model3.content = @".使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode ，alignment等使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode ，alignment等等；";
    


    
    Model *model4 = [[Model alloc]init];
    model4.title = @"444444444444";
    model4.content = @".使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode.使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode.使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode.使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致";
    Model *model5 = [[Model alloc]init];
    model5.title = @"55555555555";
    model5.content = @"..使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode.使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode.使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode.使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode.使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode.使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致，例： @{NSFontAttributeName:[UIFont systemFontOfSize:16]},计算时传入的字体大小为16，实际显示的大小为17；这里字体只是个例子，明眼人都知道，可是往往忽略的还有 lineBreakMode使用boundingRectWithSize：计算时传入的相关属性与实际显示的 UILabel 属性不一致";
    [self.data addObject:model1];
    [self.data addObject:model2];
    [self.data addObject:model3];
    [self.data addObject:model4];
    [self.data addObject:model5];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    Model *model = self.data[indexPath.row];
    NSLog(@"%lf",cell.height);
    NSMutableParagraphStyle  *style = [[NSMutableParagraphStyle defaultParagraphStyle]mutableCopy];
    [style setAlignment:NSTextAlignmentRight];
    style.lineBreakMode = NSLineBreakByCharWrapping;
    NSAttributedString *str = [[NSAttributedString alloc]initWithString:model.content attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17],NSParagraphStyleAttributeName : style}];
   CGFloat hei = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 30, 1000) options:NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
    // = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 30, 1000) options:NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
    return  5 + 20 + 5 + 100 + hei + 20 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Model *model = self.data[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = model;
    return cell;
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
