//
//  WebSiteViewController.swift
//  AlamofireSample
//
//  Created by Rudson Lima on 7/23/16.
//  Copyright © 2016 Rudson Lima. All rights reserved.
//

import UIKit

class WebSiteViewController: UIViewController, UIWebViewDelegate {

    var company: Company!
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        txtTitle.text = company.name
        
        loadUrl()
    }
    
    func loadUrl(){
        let url = NSURL(string: company.detail!.url!)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView){
        indicatorView.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView){
        indicatorView.stopAnimating()
    }
    
    @IBAction func onActionClick(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
