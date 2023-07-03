//
//  RegisterViewController.swift
//  chatiOS13
//
//  Created by Alsaba Salim on 7/2/23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var registeredName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.tintColor])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.tintColor])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.tintColor])
        
    }

    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text {
            registeredName = name
            Auth.auth().createUser(withEmail: email, password: password){authResult, error in
                if let e = error {
                    print("Error registering user, \(e.localizedDescription)")
                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.registerSegue {
            let destinationVC = segue.destination as! ChatViewController
            destinationVC.registeredName = registeredName
        }
    }
    

}
