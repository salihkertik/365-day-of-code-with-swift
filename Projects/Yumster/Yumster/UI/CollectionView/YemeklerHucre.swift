//
//  YemeklerHucre.swift
//  Yumster
//
//  Created by Salih Kertik on 11.10.2023.
//

import UIKit

protocol HucreProtocol {
    func sepeteEkleTikla(indexPath:IndexPath)
}

class YemeklerHucre: UICollectionViewCell {
    
    @IBOutlet weak var imageViewYemek: UIImageView!
    
    @IBOutlet weak var labelisim: UILabel!
    @IBOutlet weak var labelFiyat: UILabel!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    
    
}
