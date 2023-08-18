//
//  detailsVC.swift
//  SimpsonBook
//
//  Created by Salih Kertik on 18.08.2023.
//

import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedSimpson : Simpson?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image

    }
    

}
