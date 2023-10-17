//
//  AnasayfaViewModel.swift
//  Yumster
//
//  Created by Salih Kertik on 12.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    
    var yrepo = YemeklerDaoRepository()
    var yemeklerListesi = BehaviorSubject<[Yemekler]>(value: [Yemekler]())
    
    init(){
        yemeklerListesi = yrepo.yemeklerListesi
        yemekleriYukle()
    }
    
    func yemekleriYukle(){
        yrepo.yemekleriYukle()
    }
    
    func ara(aramaKelimesi: String) {
        do {
            let filtrelenmisYemekler = try yemeklerListesi.value().filter { yemek in
                return yemek.yemek_adi?.contains(aramaKelimesi) ?? false
            }
            yemeklerListesi.onNext(filtrelenmisYemekler)
        } catch {
            print("Hata oluştu: \(error)")
        }
    }
    
    func sepeteYemekEkle(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:String, kullanici_adi:String){
        yrepo.yemekleriYukle()
    }
    
    
}

