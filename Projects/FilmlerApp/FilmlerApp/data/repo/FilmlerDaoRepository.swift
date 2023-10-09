//
//  FilmlerDaoRepository.swift
//  FilmlerApp
//
//  Created by Salih Kertik on 8.10.2023.
//

import Foundation
import RxSwift

class FilmlerDaoRepository {
    
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    
    func filimleriYukle(){
        var liste = [Filmler]()
        let f1 = Filmler(id: 1, ad: "Django", resim: "django", fiyat: 24)
        let f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 32)
        let f3 = Filmler(id: 3, ad: "Inception", resim: "inception", fiyat: 16)
        let f4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 28)
        let f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 18)
        let f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 20)
        liste.append(f1)
        liste.append(f2)
        liste.append(f3)
        liste.append(f4)
        liste.append(f5)
        liste.append(f6)
        filmlerListesi.onNext(liste)
    }
    
}
