//
//  AppDelegate.swift
//  SwiftTest
//
//  Created by Peter on 16/4/13.
//  Copyright © 2016年 Peter. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let arr:NSMutableArray = NSMutableArray()
       
        let item1:XBTabItem = XBTabItem()
        item1.title = "hello1"
        item1.root = ViewController()
        item1.selectImage = "icon1_s"
        item1.unselectImage = "icon1_u"
        
        let item2:XBTabItem = XBTabItem()
        item2.title = "hello2"
        item2.root = UIViewController()
        item2.selectImage = "icon1_s"
        item2.unselectImage = "icon1_u"
        
        arr.addObject(item1)
        arr.addObject(item2)
        
        let tab:XBBaseTabVC = XBBaseTabVC.initWithItems(arr)
        
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.blueColor()
        self.window?.becomeKeyWindow()
        self.window?.makeKeyAndVisible()
        
        self.window?.rootViewController = tab
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

