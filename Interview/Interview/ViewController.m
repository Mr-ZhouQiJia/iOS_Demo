//
//  ViewController.m
//  Interview
//
//  Created by ddsc on 2019/5/13.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import "ViewController.h"
#import "People.h"
#import "Man.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Man *aman = [[Man alloc]init];
    NSLog(@"a%@",aman);
    [Man attempRelease];
    NSLog(@"a%@",aman);
    
    Man *bman = [Man shareSingleton];
    NSLog(@"b%@",bman);
    [Man attempRelease];
    NSLog(@"b%@",bman);
    Man *cman = [bman copy];
    NSLog(@"c%@",cman);
    [Man attempRelease];
    NSLog(@"c%@",cman);
    
}


@end
