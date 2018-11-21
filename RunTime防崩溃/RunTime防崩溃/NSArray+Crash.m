//
//  NSArray+Crash.m
//  RunTime防崩溃
//
//  Created by ddsc on 2018/6/5.
//  Copyright © 2018年 ddsc. All rights reserved.
//

#import "NSArray+Crash.h"
#import <objc/runtime.h>
@implementation NSArray (Crash)


+ (void)load{
    Method  oldMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    Method  newMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(crash_objectAtIndex:));
   
    method_exchangeImplementations(oldMethod, newMethod);
    
}

- (id)crash_objectAtIndex:(NSUInteger)index{
    
   // NSLog(@"数组未越界");
    if (index >= self.count) {
        NSLog(@"数组越界");
        return nil;
    }
    
    return [self crash_objectAtIndex:index];
}


@end
