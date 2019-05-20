//
//  Man.m
//  Interview
//
//  Created by ddsc on 2019/5/13.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import "Man.h"

@implementation Man
//+(void)load{
//    NSLog(@"%s",__FUNCTION__);
//}
//-  (instancetype)init{
//    if (self = [super init]) {
//        NSLog(@"%s",__FUNCTION__);
//    }
//    return self;
//}
//+ (void)initialize{
//    NSLog(@"%s",__FUNCTION__);
//}
static Man * instance;
static dispatch_once_t onceToken1;
static dispatch_once_t onceToken2;
+(instancetype)shareSingleton{
    
    dispatch_once(&onceToken1, ^{
        if (instance == nil) {
            instance = [[Man alloc]init];
        }
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    dispatch_once(&onceToken2, ^{
        if (instance == nil) {
            instance = [super allocWithZone:zone];
        }
    });
    return instance;
}
- (id)copyWithZone:(NSZone *)zone{
    return  self;
}

//单例释放
//onceToken必须拿到函数体外成为全局的,
+ (void)attempRelease{
    onceToken1 = 0; // 只有置为0,GCD才认为 从未执行过,它默认为0,这样才能保证下次再创建对象
    onceToken2 = 0;
    instance = nil;
}
@end
