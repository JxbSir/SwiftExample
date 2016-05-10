//
//  XBBaseNavVC.swift
//  SwiftTest
//
//  Created by Peter on 16/5/10.
//  Copyright © 2016年 Peter. All rights reserved.
//

import UIKit

class XBBaseNavVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = self.viewControllers.count >= 1
        super.pushViewController(viewController, animated: animated)
    }
}
