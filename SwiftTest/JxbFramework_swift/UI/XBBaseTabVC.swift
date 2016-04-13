//
//  XBBaseTabVC.swift
//  SwiftTest
//
//  Created by Peter on 16/4/13.
//  Copyright © 2016年 Peter. All rights reserved.
//

import UIKit

class XBTabItem: NSObject {
    var title:NSString!
    var root:UIViewController!
    var selectImage:String!
    var unselectImage:String!
}

class XBBaseTabVC: UITabBarController {
    
    //MARK: 公有接口
    
    /**
     初始化Tab控制器
     
     - parameter items: Tab项目数组
     
     - returns: 控制器
     */
    class func initWithItems(items:NSArray) -> XBBaseTabVC {
        let tab:XBBaseTabVC = XBBaseTabVC.init(nibName: nil, bundle: nil)
        tab.initUI(items)
        return tab;
    }
    
    //MARK: 私有接口
    
    /**
     处理每项Tab UI
     
     - parameter items: Tab项目数组
     */
    private func initUI(items:NSArray) -> Void {
        let arrVCS:NSMutableArray = NSMutableArray()
        for item in items {
            let vc:UIViewController = item.root
            vc.tabBarItem = UITabBarItem.init(title: item.title, image: UIImage.init(named: item.unselectImage), selectedImage: UIImage.init(named: item.selectImage))
            let nav:UINavigationController = UINavigationController.init(rootViewController: item.root)
            arrVCS.addObject(nav)
        }
        self.viewControllers = arrVCS as NSArray as? [UIViewController]
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.grayColor()], forState: UIControlState.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.redColor()], forState: UIControlState.Selected)
    }


}
