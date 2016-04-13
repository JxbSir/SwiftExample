//
//  ViewController.swift
//  SwiftTest
//
//  Created by Peter on 16/4/13.
//  Copyright © 2016年 Peter. All rights reserved.
//

import UIKit
import EVReflection

class x_item: EVObject {
    var title:String?
    var content:String?
}

class x_result: EVObject {
    var notice:[x_item]?
}

class xxx: EVObject {
    var code:String?
    var msg:String?
    var result:x_result?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dic = NSMutableDictionary()
        dic.setValue("iOS", forKey: "platform")
        dic.setValue("iOS", forKey: "client")
        dic.setValue("1.8.0", forKey: "clientVersion")
        
        func successBlock(result:NSDictionary) -> Void {
            print(result)
            
            
        }
        
        func failureBlock(error:NSError) -> Void {
            // function body goes here
            
        }
        
        XBHttpClient.sharedInstance.Post("http://api.cuitrip.com/baseservice/getVersionCtrl", params: dic, successCallback: successBlock, failureCallback: failureBlock)
        
       
        var dic2 = NSMutableDictionary()
        dic2.setValue("zh-Hant", forKey: "lang")
        dic2.setValue("1", forKey: "type")
        
        func successBlock2(result:NSDictionary) -> Void {
            print(result)
            let model:xxx = xxx(dictionary: result)
            
            var count:Int = (model.result?.notice?.count)!
            var item:x_item = (model.result?.notice![0])!
        }
        
        func failureBlock2(error:NSError) -> Void {
            // function body goes here
            
        }
        
        XBHttpClient.sharedInstance.Post("http://api.cuitrip.com/baseservice/getInfoPages", params: dic2, successCallback: successBlock2, failureCallback: failureBlock2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

