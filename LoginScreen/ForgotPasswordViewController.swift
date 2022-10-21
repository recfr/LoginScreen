//
//  ForgotPasswordViewController.swift
//  LoginScreen
//
//  Created by Recep on 14.10.2022.
//

import UIKit

extension String {
    func isValidEmail() -> Bool {
            // here, `try!` will always succeed because the pattern is valid
            let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        }
}

class ForgotPasswordViewController: UIViewController {

    
    @IBOutlet weak var emailTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Reset password"
    }

    @IBAction func resetPasswordButton(_ sender: Any) {
        
        if emailTextfield.text == "" {
            
            showAlertMessage(title: "Warning", message: "Email is empty")
            
        } else if emailTextfield.text!.isValidEmail() {
            
            showAlertMessage(title: "Info", message: "Please check your inbox \(emailTextfield.text!)")
            
        } else {
            
            showAlertMessage(title: "Warning", message: "Please check your email.")
        }
    }
    
    func showAlertMessage(title: String, message: String) {
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            print("\(message)")
        }
        
        alertMessage.addAction(okButton)
        present(alertMessage, animated: true, completion: nil)
    }
    
}
