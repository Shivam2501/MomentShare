//
//  LoginViewController.swift
//  MomentShare
//
//  Created by Shivam Bharuka on 3/6/16.
//  Copyright © 2016 Shivam Bharuka. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sign_in(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(username.text!, password: password.text!) { (success: PFUser?, error: NSError?) -> Void in
            if success != nil {
                print("user is logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }else{
                print("User doesnt exist")
            }
        }
    }

    @IBAction func signout(sender: AnyObject) {
        let newuser = PFUser()
        
        newuser.username = username.text
        newuser.password = password.text
        
        newuser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success{
                print("Created a User")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }else{
                print(error?.localizedDescription)
            }
        }
        
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
