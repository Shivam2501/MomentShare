//
//  HomeViewController.swift
//  MomentShare
//
//  Created by Shivam Bharuka on 3/6/16.
//  Copyright © 2016 Shivam Bharuka. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var query = PFQuery(className: "Post")
        query.getObjectInBackgroundWithId("imkmJsHVIH") {
            (post: PFObject?, error: NSError?) -> Void in
            if error == nil && gameScore != nil {
                print(post)
            } else {
                print(error)
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(sender: AnyObject) {
        PFUser.logOut()
        NSNotificationCenter.defaultCenter().postNotificationName("UserLoggedOut", object: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
