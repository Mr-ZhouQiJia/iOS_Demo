//
//  NSKeyedArchiverVC.m
//  DataPersistence
//
//  Created by ddsc on 2019/5/21.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import "NSKeyedArchiverVC.h"
#import "Man.h"
@interface NSKeyedArchiverVC ()

@end

@implementation NSKeyedArchiverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [self.view addSubview:btn];
    [btn setTitle:@"归档" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(archiver) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(100, 200, 100, 30);
    [self.view addSubview:btn2];
    [btn2 setTitle:@"归档" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(unArchiver) forControlEvents:UIControlEventTouchUpInside];
}

- (void)archiver{
    
    Man *aMan = [[Man alloc]init];
    aMan.name = @"Timer";
    aMan.age = 25;
    UIImage *image = [UIImage imageNamed:@"WechatIMG2.jepg"];
    aMan.headerImage = image;
    
    NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    [file stringByAppendingPathComponent:@"person.txt"];
    NSMutableData *data = [NSMutableData data];
    NSData *aManData = [NSKeyedArchiver archivedDataWithRootObject:aMan requiringSecureCoding:YES error:nil];
    NSKeyedArchiver *ach = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    NSLog(@"%@",aManData);
    
}

- (void)unArchiver{
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
