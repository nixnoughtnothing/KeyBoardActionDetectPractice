//
//  ViewController.swift
//  KeyBoardActionDetectPractice
//
//  Created by nixnoughtnothing on 8/29/15.
//  Copyright © 2015 nix nought nothing. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // キーボードの開閉を検知したら、下記のメソッドを呼び出す
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidShow:", name: "UIKeyboardWillShowNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: "UIKeyboardWillHideNotification", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        // observerを破棄
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "UIKeyBoardWillShowNotification", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "UIKeyBoardWillHideNotification", object: nil)
    }
    
    // MARK: - Observerアクション
    func keyboardDidShow(notification:NSNotification){
        print("keyboardDidShow:")
        
    }
    
    func keyboardWillHide(notification:NSNotification){
        print("keyboardWillHide")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self

        self.loadRequest("https://google.com")
        
    }
    
    func loadRequest(urlString: String){
        let queryUrl = NSURL(string: urlString)
        let req = NSURLRequest(URL: queryUrl!)
        self.webView.loadRequest(req)
        
        // Show indicator
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    // MARK: UIWebViewDelegateのプロトコルメソッド
    func webViewDidFinishLoad(webView: UIWebView) {
        
        // hide idicator
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

