//
//  ViewController.swift
//  Foursquare
//
//  Created by Salih Kertik on 25.08.2023.
//

import UIKit
import Parse



class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
      
        
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        // Giriş işlemleri
        
        if usernameText.text != "" && passwordText.text != "" {
            
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passwordText.text!) { (user, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    
                    // Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                    
                    
                }
            }
            
            
        }else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password ??")
        }
        
        
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        // Kullanıcı oluşturmak
        if usernameText.text != "" && passwordText.text != "" {
            let user = PFUser()
            user.username = usernameText.text!
            user.password = passwordText.text!
            
            user.signUpInBackground{(success, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error!!")
                }else{
                    //Segue
                    print("OK!")
                }
            }
        }else{
            makeAlert(titleInput: "Error", messageInput: "Username / Password??")
        }
        
        
    }
    
    
    // Hata mesajı fonksiyonumuz
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}

