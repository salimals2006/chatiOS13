//
//  LoginViewController.swift
//  chatiOS13
//
//  Created by Alsaba Salim on 7/2/23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loginEmailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.tintColor])
        loginPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.tintColor])
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let loginEmail = loginEmailTextField.text, let loginPassword = loginPasswordTextField.text {
            Auth.auth().signIn(withEmail: loginEmail, password: loginPassword){ authResult, error in
                if let e = error {
                    print("There was an error signing in, \(e.localizedDescription)")
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}
