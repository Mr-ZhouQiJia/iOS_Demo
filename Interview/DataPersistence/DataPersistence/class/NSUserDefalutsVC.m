//
//  NSUserDefalutsVC.m
//  DataPersistence
//
//  Created by ddsc on 2019/5/20.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import "NSUserDefalutsVC.h"

@interface NSUserDefalutsVC ()

@end

@implementation NSUserDefalutsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:@"Timer" forKey:@"name"];
    [user setObject:@"man" forKey:@"agent"];
    UIImage *image = [UIImage imageNamed:@"WechatIMG2.jpeg"];
    NSData *data = UIImageJPEGRepresentation(image, 100);
    [user setObject:data forKey:@"image"];
    [user synchronize];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 200, 50)];
    [self.view addSubview:label];
    NSString *name = [[NSUserDefaults standardUserDefaults]objectForKey:@"name"];
    label.text = name;
    
    NSData *imageData = [user objectForKey:@"image"];
    UIImage *im = [[UIImage alloc]initWithData:imageData];
    UIImageView *ima = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    ima.image = im;
    [self.view addSubview:ima];
}

@end
