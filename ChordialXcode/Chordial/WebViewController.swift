//
//  WebViewController.swift
//  Chordial
//
//  Created by Ziv Kaputa on 10/24/16.
//  Copyright © 2016 Ziv Kaputa. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
       
        
        let URL = NSURL(string: "https://accounts.spotify.com/authorize?client_id=c0be0c89a1e241898635418ad5fbbbef&amp;response_type=code&amp;scope=user-follow-read&amp;redirect_uri=http%3A%2F%2Flocalhost%3A10010%2Fuser%2Fcallback")
        webView.delegate = self
        webView.loadRequest(NSURLRequest(url: URL as! URL) as URLRequest)
        // Do any additional setup after loading the view.
    }
    
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let currentSite = (webView.request?.url?.absoluteString)! as String
        print("Finished Loading ---------------------------------------------")
        print(currentSite)
        if !(currentSite.contains("spotify")){
            let doc = webView.stringByEvaluatingJavaScript(from: "document.body.innerHTML")
            print(doc!)
            webView.removeFromSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
