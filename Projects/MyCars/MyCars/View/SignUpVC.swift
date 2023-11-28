//
//  SignUpVC.swift
//  MyCars
//
//  Created by Salih Kertik on 28.10.2023.
//

import UIKit
import FirebaseAuth

class SignUpVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var isLoginSuccessful = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty, let password = passwordTF.text, !password.isEmpty else {
            displayAlertt(message: "Fill in the email and password fields.")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                self.displayAlertt(message: "Failed to create record: \(error.localizedDescription)")
            } else {
                self.isLoginSuccessful = true
                self.performSegue(withIdentifier: "toLogin", sender: self)
                self.displayAlertt(message: "Registration created. You can log in ✅")
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toLogin" {
            return isLoginSuccessful
        }
        return true
    }
    
    func displayAlertt(message: String) {
        let alert = UIAlertController(title: "MESSAGE", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
