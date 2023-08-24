//
//  SettingsViewController.swift
//  FirebaseInstaClone
//
//  Created by Salih Kertik on 23.08.2023.
//

import UIKit
import Firebase


class SettingsViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch{
            print("ERROR!")
        }
    }
    

}
