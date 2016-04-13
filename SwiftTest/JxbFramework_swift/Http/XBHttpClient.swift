//
//  XBHttpClient.swift
//  SwiftTest
//
//  Created by Peter on 16/4/13.
//  Copyright © 2016年 Peter. All rights reserved.
//

import UIKit
import Alamofire

typealias httpSuccessCallback = (result:NSDictionary)->Void
typealias httpFailureCallback = (error:NSError)->Void

class XBHttpClient: NSObject {
    //单例
    static let sharedInstance = XBHttpClient()
    
    //MARK: Http请求
    /**
     Get请求
     
     - parameter url:             接口地址
     - parameter successCallback: 成功回调
     - parameter failureCallback: 失败回调
     */
    func Get(url:String, successCallback:httpSuccessCallback?, failureCallback:httpFailureCallback?) -> Void {
        weak var wSelf = self
        Alamofire.request(.GET, url).responseJSON {httpresponse in
            wSelf?.handleHttpResponse(url, response: httpresponse.response!, data: httpresponse.data!, error: httpresponse.result.error, successCallback: successCallback, failureCallback: failureCallback)
        }
    }
    
    /**
     Post请求
     
     - parameter url:             接口地址
     - parameter params:          参数，字典
     - parameter successCallback: 成功回调
     - parameter failureCallback: 失败回调
     */
    func Post(url:String, params:NSDictionary, successCallback:httpSuccessCallback?, failureCallback:httpFailureCallback?) -> Void {
        weak var wSelf = self
        let paramString:[String : AnyObject] = params as! [String : AnyObject]
        let headers = ["Content-Type": "application/json"]
        Alamofire.request(.POST, url, parameters: paramString, encoding: .JSON, headers: headers).responseJSON { httpresponse in
            wSelf?.handleHttpResponse(url, response: httpresponse.response, data: httpresponse.data, error: httpresponse.result.error,successCallback: successCallback, failureCallback: failureCallback)
        }
    }
    
    //MARK: 私有函数，处理Response
    private func handleHttpResponse(url:String,response:NSHTTPURLResponse?, data:NSData?, error:NSError?, successCallback:httpSuccessCallback?, failureCallback:httpFailureCallback?) {
        if (response == nil && error != nil) {
            if (failureCallback != nil) {
                failureCallback!(error: error!);
            }
        }
        else if (response!.statusCode == 200) {
            let result = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            if (successCallback != nil) {
                successCallback!(result: result)
            }
        } else {
            if (failureCallback != nil) {
                let result = NSString.init(data: data!, encoding: NSUTF8StringEncoding)
                let title = NSString.init(format: "Http Error(%d)", response!.statusCode)
                let error:NSError = NSError.init(domain: url, code: response!.statusCode, userInfo: [NSLocalizedFailureReasonErrorKey:title ,NSLocalizedDescriptionKey:result!] as [NSObject:NSObject])
                
                failureCallback!(error: error)
            }
        }
    }
}
