//
//  Man.h
//  DataPersistence
//
//  Created by ddsc on 2019/5/21.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Man : NSObject<NSCoding>

@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign)NSInteger age;
@property(nonatomic, copy)UIImage *headerImage;








@end

NS_ASSUME_NONNULL_END
