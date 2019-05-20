//
//  Man.h
//  Interview
//
//  Created by ddsc on 2019/5/13.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import "People.h"

NS_ASSUME_NONNULL_BEGIN

@interface Man : People<NSCopying>

@property (nonatomic, strong)NSString *age;
@property (nonatomic, strong)NSString *monney;
+ (void)load;
//-(instancetype)init;
+ (void)initialize;
+(instancetype)shareSingleton;

- (id)copyWithZone:(NSZone *)zone;

+ (void)attempRelease;

@end

NS_ASSUME_NONNULL_END
