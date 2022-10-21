//
//  CreateAccountViewController.swift
//  LoginScreen
//
//  Created by Recep on 13.10.2022.
//

import UIKit

//extension UIViewController {
//    func showDialog(title: String, message: String){
//        let alertDialog = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
//        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
//            print("\(message)")
//        }
//
//        alertDialog.addAction(okButton)
//        present(alertDialog, animated: true, completion: nil)
//    }
//}

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var isSignedUp = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Sign Up"
    }

    @IBAction func signUpButton(_ sender: Any) {
        
        if emailTextField.text == "" {
            
            showDialog(title: "Warning", message: "Email is empty")
            
        } else if passwordTextField.text == "" || confirmPasswordTextField.text == "" {
            
            showDialog(title: "Warning", message: "Password is empty")
            
        } else if passwordTextField.text != confirmPasswordTextField.text {
            
            showDialog(title: "Warning", message: "Passwords are not matched")
        } else {
            
            isSignedUp = true
            showDialog(title: "Succes", message: "Sign up successful")
            
            UserDefaults.standard.set(emailTextField.text, forKey: "email")
            UserDefaults.standard.set(passwordTextField.text, forKey: "password")
        }

    }
    
    func showDialog(title: String, message: String) {
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            print("\(message)")
        }

        alertMessage.addAction(okButton)
        present(alertMessage, animated: true, completion: nil)
    }

}
