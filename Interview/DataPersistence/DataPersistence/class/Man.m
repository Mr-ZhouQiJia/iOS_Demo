//
//  Man.m
//  DataPersistence
//
//  Created by ddsc on 2019/5/21.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import "Man.h"

@implementation Man



- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeObject:self.headerImage forKey:@"headerImage"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
        self.headerImage = [aDecoder decodeObjectForKey:@"headerImage"];
    }
    return  self;
}
@end
