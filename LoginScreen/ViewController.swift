//
//  ViewController.swift
//  LoginScreen
//
//  Created by Recep on 13.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Log In"
    }
    
    @IBAction func forgotPasswordButtonOnClick(_ sender: Any) {
        self.performSegue(withIdentifier: "toForgotPassword", sender: nil)
    }
    
    @IBAction func logInButtonOnClick(_ sender: Any) {
        
        let inputEmail = UserDefaults.standard.string(forKey: "email")
        let inputPassword = UserDefaults.standard.string(forKey: "password")
        
        if emailTextField.text == inputEmail && passwordTextField.text == inputPassword {
            self.performSegue(withIdentifier: "toLoggedIn", sender: nil)
        } else if emailTextField.text == "" || passwordTextField.text == "" {
            showDialog(title: "Warning", message: "Please fill all fields.")
        } else {
            showDialog(title: "Warning", message: "Email or password not correct.")
        }
    }
    
    @IBAction func signUpButtonOnClick(_ sender: Any) {
        self.performSegue(withIdentifier: "toCreateAccountVC", sender: nil)
    }
    
    // TODO Research: extension for UIViewController class or top-level declaration ?
    func showDialog(title: String, message: String) {
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            print("\(message)")
        }

        alertMessage.addAction(okButton)
        present(alertMessage, animated: true, completion: nil)
    }
    
}
