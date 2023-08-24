//
//  ViewController.swift
//  FirebaseInstaClone
//
//  Created by Salih Kertik on 23.08.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailText.textColor = UIColor.blue
        emailText.font = UIFont.boldSystemFont(ofSize: 16)
        emailText.backgroundColor = UIColor.white
        
        emailText.layer.borderColor = UIColor.gray.cgColor
        emailText.layer.borderWidth = 1.0
        emailText.layer.cornerRadius = 8.0
        
        passwordText.textColor = UIColor.blue
        passwordText.font = UIFont.boldSystemFont(ofSize: 16)
        passwordText.backgroundColor = UIColor.white
        
        passwordText.layer.borderColor = UIColor.gray.cgColor
        passwordText.layer.borderWidth = 1.0
        passwordText.layer.cornerRadius = 8.0

    
        signInButton.setTitleColor(UIColor.white, for: .normal)
        signInButton.layer.cornerRadius = 15 // Butonu yuvarlak yapmak için yarıçapı yüksekliğinin yarısı yapın
        
        
        
       
        
    }

   
    
    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil{
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
                
            }
        }else {
                makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
                
        }
            
            
    }
        
    @IBAction func signUpClicked(_ sender: Any) {
        
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
                }else{
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
            }

            
        }else{
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
            
        }
        
        
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

