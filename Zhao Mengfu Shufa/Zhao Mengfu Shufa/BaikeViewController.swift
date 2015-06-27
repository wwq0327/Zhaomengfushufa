//
//  BaikeViewController.swift
//  Zhao Mengfu Shufa
//
//  Created by wyatt on 15/6/24.
//  Copyright (c) 2015年 Wanqing Wang. All rights reserved.
//

import UIKit

class BaikeViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var site: String!
    var info: NSDictionary!
    
    @IBAction func closeTapped(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航上的标题
        title = info.objectForKey("name") as? String

        site = info.objectForKey("url") as! String
        
        let url = NSURL(string: site)
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
