//
//  ViewController.m
//  RunTime防崩溃
//
//  Created by ddsc on 2018/6/5.
//  Copyright © 2018年 ddsc. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Crash.h"
//#import "NSMutableDictionary+Safe.h"
@interface ViewController ()

@end
enum ABCD {
    A,
    B,
    C
};



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = @[@"111",@"111"];
    NSString *a = [array objectAtIndex:1];
    NSString *b = [array objectAtIndex:2];
    
    NSMutableDictionary *dic = [@{}mutableCopy];
    [dic setObject:nil forKey:@"111"];
    NSLog(@"%@",a);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
