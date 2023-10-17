//
//  SepetYemekler.swift
//  Yumster
//
//  Created by Salih Kertik on 12.10.2023.
//

import Foundation

class SepetYemekler : Codable {
    
    var sepet_yemek_id:String?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:String?
    var yemek_siparis_adet:String?
    var kullanici_adi = "salih_kertik"
    
    init(){
        
    }
    
    init(sepet_yemek_id: String?, yemek_adi: String?, yemek_resim_adi: String?, yemek_fiyat: String?, yemek_siparis_adet: String?, kullanici_adi: String = "salih_kertik") {
        self.sepet_yemek_id = sepet_yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.yemek_siparis_adet = yemek_siparis_adet
        self.kullanici_adi = kullanici_adi
    }
    
}
