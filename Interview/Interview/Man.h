//
//  Man.h
//  Interview
//
//  Created by ddsc on 2019/5/13.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import "People.h"

NS_ASSUME_NONNULL_BEGIN

@interface Man : People

@property (nonatomic, strong)NSString *age;
@property (nonatomic, strong)NSString *monney;
+ (void)load;
//-(instancetype)init;
+ (void)initialize;
@end

NS_ASSUME_NONNULL_END
