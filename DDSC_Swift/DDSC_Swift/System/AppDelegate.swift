//
//  AppDelegate.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/11/28.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("宽度:\(ZX_WIDTH),高度:\(ZZX_HEIGHT)")
        
        //创建tabbar
        self.createTabbar()
        
        
        
        
        
        
        
        
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
    }
}

extension AppDelegate {
    func createTabbar() {
        
        let recommendVC     = ZXRecommendViewController()
        let recommendNavi   = BaseNavigationVC.init(rootViewController: recommendVC)
        let recommendTabBarItem = UITabBarItem(title: "推荐", image: UIImage(named: "icon_tabbar_recommend_nor"), selectedImage: UIImage(named: "icon_tabbar_recommend_press")?.withRenderingMode(.alwaysOriginal) )
        recommendVC.tabBarItem = recommendTabBarItem
        
        let projectVC       = ZXProjectViewController()
        let projectNavi     = BaseNavigationVC.init(rootViewController: projectVC)
        let projectTabBarItem = UITabBarItem(title: "项目", image:UIImage(named: "icon_tabbar_licai_nor"), selectedImage: UIImage(named: "icon_tabbar_licai_press"))
        projectVC.tabBarItem = projectTabBarItem
        
        let mineVC          = ZXMineViewController()
        let mineNavi        = BaseNavigationVC.init(rootViewController: mineVC)
        let mineTabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "icon_tabbar_mycount_nor"), selectedImage: UIImage(named: "icon_tabbar_mycount_press"))
        mineVC.tabBarItem = mineTabBarItem
        
        let moreVC          = ZXMoreViewController()
        let moreNavi        = BaseNavigationVC.init(rootViewController: moreVC)
        let moreTabBarItem = UITabBarItem(title: "发现", image: UIImage(named: "icon_tabbar_discover_nor"), selectedImage: UIImage(named: "icon_tabbar_discover_press"))
        moreVC.tabBarItem = moreTabBarItem
        
        let myTab           = BaseTabBarVC()
        myTab.viewControllers = [recommendNavi,projectNavi,mineNavi,moreNavi]
        let textAttributes = [NSAttributedString.Key.foregroundColor : UIColor.orange]
        let normalAttributes =  [NSAttributedString.Key.foregroundColor : UIColor.gray]
        recommendVC.tabBarItem.setTitleTextAttributes(textAttributes, for: UIControl.State.selected)
        recommendVC.tabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        projectVC.tabBarItem.setTitleTextAttributes(textAttributes, for: UIControl.State.selected)
        projectVC.tabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        mineVC.tabBarItem.setTitleTextAttributes(textAttributes, for: UIControl.State.selected)
        mineVC.tabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        moreVC.tabBarItem.setTitleTextAttributes(textAttributes, for: UIControl.State.selected)
        moreVC.tabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = myTab
    }
}
