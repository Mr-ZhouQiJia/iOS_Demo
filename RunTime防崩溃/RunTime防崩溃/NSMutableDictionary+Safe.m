//
//  NSMutableDictionary+Safe.m
//  RunTime防崩溃
//
//  Created by ddsc on 2018/6/5.
//  Copyright © 2018年 ddsc. All rights reserved.
//

#import "NSMutableDictionary+Safe.h"
#import <objc/runtime.h>
@implementation NSMutableDictionary (Safe)

+ (void)load{
    
    Method a = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKey:));
    Method b = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(safe_setObject:forKey:));
    
    method_exchangeImplementations(a, b);
    
    
    
}

-(void)safe_setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (!anObject) {
        NSLog(@"value 为空");
        return;
    }
    [self safe_setObject:anObject forKey:aKey];
}



@end
