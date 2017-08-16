//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Sujanth Sebamalaithasan on 13/8/17.
//  Copyright © 2017 Sujanth Sebamalaithasan. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        
        guard let email = emailTxtField.text, emailTxtField.text != "" else { return }
        guard let password = passwordTxtField.text, passwordTxtField.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    
                    if success {
                        print("Logged in user!", AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    
    @IBAction func pickAvatarBtnPressed(_ sender: Any) {
    }
    
    @IBOutlet weak var pickBGColorBtnPressed: UIButton!
    
}
