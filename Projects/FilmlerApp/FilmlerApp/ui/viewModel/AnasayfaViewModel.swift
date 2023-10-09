//
//  AnasayfaViewModel.swift
//  FilmlerApp
//
//  Created by Salih Kertik on 8.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    var frepo = FilmlerDaoRepository()
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    init(){
        filmlerListesi = frepo.filmlerListesi
        filimleriYukle()
    }
    func filimleriYukle(){
        frepo.filimleriYukle()
    }
    
}
