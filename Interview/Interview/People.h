//
//  People.h
//  Interview
//
//  Created by ddsc on 2019/5/13.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface People : NSObject

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *agent;

+ (void)load;

//- (instancetype)init;
+(void)initialize;
@end

