//
//  SepetHucre.swift
//  Yumster
//
//  Created by Salih Kertik on 15.10.2023.
//

import UIKit

class SepetHucre: UITableViewCell {
    
    @IBOutlet weak var imageViewYemek: UIImageView!
    @IBOutlet weak var labelYemekFiyat: UILabel!
    @IBOutlet weak var labelAdet: UILabel!
    @IBOutlet weak var labelYemekAdi: UILabel!
    @IBOutlet weak var labelToplamYemekFiyat: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
