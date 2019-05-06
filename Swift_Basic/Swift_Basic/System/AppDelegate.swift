//
//  AppDelegate.swift
//  Swift_Basic
//
//  Created by ddsc on 2019/4/30.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 10.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabbar = UITabBarController()
        
        let basicNavi = BaseNavigationController(rootViewController: Swift_BasicVC())
        let basicTabBarItem = UITabBarItem()
        basicTabBarItem.title = "基础"
        basicTabBarItem.image = UIImage(named: "棒冰(1)")?.withRenderingMode(.alwaysOriginal)
        basicTabBarItem.selectedImage = UIImage(named: "棒冰")?.withRenderingMode(.alwaysOriginal)
        basicNavi.tabBarItem = basicTabBarItem
        
        let advancedNavi = BaseNavigationController(rootViewController:Swift_Advanced())
        let advancedTabBarItem = UITabBarItem()
        advancedTabBarItem.title = "高级"
        advancedTabBarItem.image = UIImage(named: "草莓(1)")?.withRenderingMode(.alwaysOriginal)
        advancedTabBarItem.selectedImage = UIImage(named: "草莓")?.withRenderingMode(.alwaysOriginal)
        advancedNavi.tabBarItem = advancedTabBarItem
        
        let expandNavi = BaseNavigationController(rootViewController: Swift_Expand())
        let expandTabBarItem = UITabBarItem()
        expandTabBarItem.title = "拓展"
        expandTabBarItem.image = UIImage(named: "甜甜圈(1)")?.withRenderingMode(.alwaysOriginal)
        expandTabBarItem.selectedImage = UIImage(named: "甜甜圈")?.withRenderingMode(.alwaysOriginal)
        expandNavi.tabBarItem = expandTabBarItem
        
        tabbar.viewControllers = [basicNavi,advancedNavi,expandNavi]
        for items in tabbar.viewControllers! {
            items.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.init(red: 241/255.0, green: 158/255.0, blue: 194/255.0, alpha: 1.0) , NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], for: .selected)
            
        }
        
        
        self.window?.rootViewController = tabbar
        





        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Swift_Basic")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

