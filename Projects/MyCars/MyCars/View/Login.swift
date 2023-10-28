//
//  Login.swift
//  MyCars
//
//  Created by Salih Kertik on 28.10.2023.
//

import UIKit
import FirebaseAuth
import Firebase

class Login: UIViewController {
    
    var signUpVC: SignUpVC?
    var isLoginSuccessful = false
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signinButton(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            if let error = error {
                self?.displayAlert(message: error.localizedDescription)
            } else {
                self?.isLoginSuccessful = true
                self?.performSegue(withIdentifier: "toTabBar", sender: self)
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toTabBar" {
            return isLoginSuccessful
        }
        return true
    }
    
    func displayAlert(message: String) {
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

