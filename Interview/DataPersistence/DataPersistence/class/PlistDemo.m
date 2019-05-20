//
//  PlistDemo.m
//  DataPersistence
//
//  Created by ddsc on 2019/5/20.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import "PlistDemo.h"

@interface PlistDemo ()

@end

@implementation PlistDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //[self getHomeDirectory];
    [self getDataFromPlist];
}

#pragma mark-------获取沙盒目录路径-------
- (void)getHomeDirectory{
    //获取沙盒主目录路径
    NSString *homeDir = NSHomeDirectory();
    NSLog(@"沙盒主路径:%@",homeDir);
    //获取Documents文件夹路径
    NSString *docuDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"Documents文件夹路径:%@",docuDir);
    //获取Library目录路径
    NSString *libraryDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"Library路径:%@",libraryDir);
    //获取Temp文件夹路径
    NSString *tempDir = NSTemporaryDirectory();
    NSLog(@"temp文件夹路径:%@",tempDir);
    
    //获取应用程序包中的资源文件路径的方法
    NSString *imagePath = [[NSBundle mainBundle]pathForResource:@"WechatIMG2" ofType:@"jpeg" ];
    NSLog(@"%@",imagePath);
    UIImage *appImage = [[UIImage alloc]initWithContentsOfFile:imagePath];
    UIImageView *image = [[UIImageView alloc]initWithImage:appImage];
    image.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:image];
}

- (void)getDataFromPlist{
    
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"myplist" ofType:@"plist"];
    NSLog(@"%@",plistPath);
    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    NSLog(@"plist:%@",dataDic);
    dataDic[@"河南"] = @"2";
    [dataDic writeToFile:plistPath atomically:YES];
    
    NSString *plistPath1 = [[NSBundle mainBundle]pathForResource:@"myplist" ofType:@"plist"];
    NSLog(@"%@",plistPath1);
    NSMutableDictionary *dataDic1 = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath1];
    NSLog(@"plist:%@",dataDic1);
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
