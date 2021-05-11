//
//  Usuario.swift
//  Leilao
//
//  Created by Marcos Jr on 30/04/21.
//

import Foundation

class Usuario {
    
    let id:Int?
    let nome:String
    
    init(id:Int? = nil, nome:String) {
        self.id = id
        self.nome = nome
    }
}
