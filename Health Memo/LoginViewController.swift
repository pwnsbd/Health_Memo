//
//  LoginViewController.swift
//  Health Memo
//
//  Created by Pawan on 10/25/20.
// For Pushing

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            self.performSegue(withIdentifier: "LoginSegue", sender: self)
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameLabel.text
        user.password = passwordLabel.text
        user.signUpInBackground { (success, error) in
            if (success)
            {
                    print("You succcess fully loged in")
            }
            else{
                print("There was an error in signin up: \(error?.localizedDescription)")
            }
        }
    }
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameLabel.text!
        let password = passwordLabel.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (success, error) in
            if (success != nil)
            {
                self.performSegue(withIdentifier: "LoginSegue" , sender: self)
                UserDefaults.standard.set(true, forKey: "userLoggedIn")
                print("User \(username) logged in successfully")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
