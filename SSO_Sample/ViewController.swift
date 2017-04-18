//
//  ViewController.swift
//  SSO_Sample
//
//  Created by Uber - Sivajee Battina on 18/04/17.
//  Copyright © 2017 Uber. All rights reserved.
//

import UIKit
import SafariServices

let kSafariViewControllerCloseNotification = "kSafariViewControllerCloseNotification"

// facebook OAuth URL
let authURL = NSURL(string: "https://www.appzo2jo2bexx11-stage.in/suio?consumer_key=lInXLgx6HbF9FFq1ZQN8iSEnhzO3JVuf&consumer_secret=6kvwVhDGUQGXFawmulAhvORRV8HpZy5OMqMVH7xqwkLcvTbo")

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    
    var safariVC: SFSafariViewController?
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        safariVC = SFSafariViewController(URL: authURL!)
        safariVC!.delegate = self
        self.presentViewController(safariVC!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.safariLogin(_:)), name: kSafariViewControllerCloseNotification, object: nil)
    }
    
    func safariLogin(notification: NSNotification) {
        // get the url from the auth callback
        let url = notification.object as! NSURL
        // Finally dismiss the Safari View Controller with:
        self.safariVC!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true) { () -> Void in
            print("You just dismissed the login view.")
        }
    }
    
    func safariViewController(controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("didLoadSuccessfully: \(didLoadSuccessfully)")
        
    }
}