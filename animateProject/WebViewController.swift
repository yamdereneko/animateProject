//
//  WebViewController.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/2/17.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlString: String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        webView.load(request)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    deinit {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"{
            if webView.estimatedProgress == 1.0{
                navigationItem.title = webView.title
            }else{
                navigationItem.title = "Loading..."
            }
        }
    }
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func backViewTapped(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func forwardViewTapped(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        let activityItems = [urlString] as! Array<String>
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityController.excludedActivityTypes = [.postToFacebook]
        present(activityController, animated: true,completion: nil)
    }
    @IBAction func safiriViewTapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: urlString)!)
    }
}
