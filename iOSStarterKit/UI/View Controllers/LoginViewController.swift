//
//  LoginViewController.swift
//  iOSStarterKit
//
//  Created by Feialoh Francis on 8/14/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    /*===============================================================================*/
    // MARK: - Outlets
    /*===============================================================================*/
    
    
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.setHidesBackButton(true, animated: false);
        let loggedIn :Bool = UserDefaults.standard.bool(forKey: "loggedin");
        if(loggedIn) {
            self.performSegue(withIdentifier: "login_to_main", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        UserDefaults.standard.set(true, forKey:"loggedin");
        
   
        
        
        self.view.endEditing(true)
        
        sender.isEnabled = false
        
        guard let username = loginTextField.text, username.count != 0 else{
//            showAlert("Please enter username", actions: nil)
            sender.isEnabled = true
            return
        }
        guard let password = passwordTextField.text, password.count != 0 else{
//            showAlert("Please enter password", actions: nil)
            sender.isEnabled = true
            return
        }
        
//        Utilities.showLoadingWithTitle("Logging In...")
        
        ApplicationManager.shared.loginManager.login(username: username, password: password) { (userData, error) in
            
            Utilities.dismissLoading()
            
            if let error = error{
                sender.isEnabled = true
                Utilities.showAlertViewMessageWithTitle("", title: error.localizedDescription, delegate: self, cancelButtonTitle: "Ok")
                return
            }
            guard let user = userData else { return }
            
            if user.alreadyLoggedIn == "yes"{
                     self.performSegue(withIdentifier: "login_to_main", sender: self)
            }
            else{
                ApplicationManager.shared.loginManager.saveUserData(user)
                self.performSegue(withIdentifier: "login_to_main", sender: self)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/
    

}
