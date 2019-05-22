//
//  DataManager.h
//  DataPersistence
//
//  Created by ddsc on 2019/5/21.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

/**
 单例创建
 DataManager
 */
+(instancetype)shareDataManager;



@end

NS_ASSUME_NONNULL_END
