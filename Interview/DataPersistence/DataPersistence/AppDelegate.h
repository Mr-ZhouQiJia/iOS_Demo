//
//  AppDelegate.h
//  DataPersistence
//
//  Created by ddsc on 2019/5/20.
//  Copyright © 2019 ddsc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

