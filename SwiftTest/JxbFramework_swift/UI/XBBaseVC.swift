//
//  XBBaseVC.swift
//  SwiftTest
//
//  Created by Peter on 16/5/10.
//  Copyright © 2016年 Peter. All rights reserved.
//

import UIKit

typealias btnClickAction = ()->Void
private var keyButtonAction: NSString = "keyButtonAction"
private let navButtonColor: UIColor = UIColor.blackColor()

class XBBaseVC: UIViewController,UIGestureRecognizerDelegate {
    
    var disableGesture: Bool = false
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        print("class[" + self.description + "] deinit success")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.extendedLayoutIncludesOpaqueBars = false
        self.edgesForExtendedLayout = UIRectEdge.None
        self.modalPresentationCapturesStatusBarAppearance = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let count = self.navigationController?.viewControllers.count
        self.navigationController?.interactivePopGestureRecognizer?.enabled = count > 1
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.navigationController?.viewControllers.count > 1 && !disableGesture
    }
   
    //MARK: private
    private var navLeftBtn: UIButton?, navRightBtn: UIButton?
    private var leftAction: btnClickAction?, rightAction: btnClickAction?
    
    @objc private func actionBtnClick(btn: UIButton) -> Void {
        if (btn == navLeftBtn && self.leftAction != nil) {
            self.leftAction!()
        }
        if (btn == navRightBtn && self.rightAction != nil) {
            self.rightAction!()
        }
    }

    private func actionCustomNavBtn(btn: UIButton, title: NSString?, normalImage: NSString?, highlightImage: NSString?) -> Void {
        if (normalImage != nil) {
            btn.setTitleColor(navButtonColor, forState: UIControlState.Normal)
        }
        if (highlightImage != nil) {
            btn.setTitleColor(navButtonColor, forState: UIControlState.Highlighted)
        }
        else if (title != nil) {
            btn.setTitle(title! as String, forState: UIControlState.Normal)
            btn.setTitle(title! as String, forState: UIControlState.Highlighted)
            btn.setTitleColor(navButtonColor, forState: UIControlState.Normal)
            btn.setTitleColor(navButtonColor, forState: UIControlState.Highlighted)
        }
        btn.addTarget(self, action: #selector(actionBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    //MARK: public
    func setShowBackBtn(isShow: Bool) -> Void {
        if (isShow) {
            self.actionBack({[weak self] in
                self?.navigationController?.popViewControllerAnimated(true)
            });
        }
        else {
            self .actionCustomLeftBtnWithNrlImage(nil, normalImage: nil, highlightImage: nil, btnAction: {})
        }
    }

    func actionBack(btnAction: btnClickAction?) -> Void {
        self.actionCustomLeftBtnWithNrlImage("Back", normalImage: nil, highlightImage: nil, btnAction: btnAction)
    }

    func actionCustomLeftBtnWithNrlImage(title: NSString?, normalImage: NSString?, highlightImage: NSString?, btnAction:btnClickAction?) -> Void {
        navLeftBtn = UIButton.init(type: UIButtonType.Custom)
        navLeftBtn?.backgroundColor = UIColor.clearColor()
        navLeftBtn?.frame = CGRectMake(0, 0, 48, 48)
        navLeftBtn?.hidden = btnAction == nil
        self.leftAction = btnAction
        self.actionCustomNavBtn(navLeftBtn!, title: title, normalImage: normalImage, highlightImage: highlightImage)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: navLeftBtn!)
    }
    
    func actionCustomRightBtnWithNrlImage(title: NSString?, normalImage: NSString?, highlightImage: NSString?, btnAction:btnClickAction?) -> Void {
        navRightBtn = UIButton.init(type: UIButtonType.Custom)
        navRightBtn?.backgroundColor = UIColor.clearColor()
        navRightBtn?.frame = CGRectMake(0, 0, 48, 48)
        self.rightAction = btnAction
        self.actionCustomNavBtn(navRightBtn!, title: title, normalImage: normalImage, highlightImage: highlightImage)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: navRightBtn!)
    }
}
