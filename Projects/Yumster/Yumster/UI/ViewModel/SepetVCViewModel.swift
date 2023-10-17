//
//  SepetVCViewModel.swift
//  Yumster
//
//  Created by Salih Kertik on 15.10.2023.
//

import Foundation
import RxSwift

class SepetVCViewModel{
    var yrepo = YemeklerDaoRepository()
    var yemeklerListesi = BehaviorSubject<[Yemekler]>(value: [Yemekler]())
    var yemeklerListesiTwo = BehaviorSubject<[SepetYemekler]>(value: [SepetYemekler]())
    
    init(){
        yemeklerListesiTwo = yrepo.yemeklerListesiTwo
    }
    
    func sepeteYemekEkle(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:Int, yemek_siparis_adet:Int, kullanici_adi:String){
        yrepo.sepeteYemekEkle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    
    func sepettekiYemekleriGetir(kullanici_adi:String){
        yrepo.sepettekiYemekleriGetir(kullanici_adi: "salih_kertik")
    }
    
    func sepettenYemekSil(sepet_yemek_id:String,kullanici_adi:String){
        yrepo.sepettenYemekSil(sepet_yemek_id: sepet_yemek_id,kullanici_adi: kullanici_adi)
    }
    
}
