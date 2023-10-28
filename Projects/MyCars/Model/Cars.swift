//
//  Cars.swift
//  MyCars
//
//  Created by Salih Kertik on 28.10.2023.
//

import Foundation

class Cars{
    
    var id:Int?
    var name:String?
    var year:Int?
    var image:String?
    
    init(){
        
    }
    
    init(id: Int?, name: String?, year: Int?, image: String?) {
        self.id = id
        self.name = name
        self.year = year
        self.image = image
    }
}
