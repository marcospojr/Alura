//
//  CriadorDeLeilao.swift
//  Leilao
//
//  Created by Marcos Jr on 12/05/21.
//

import UIKit

class CriadorDeLeilao: NSObject {
    
    private var leilao: Leilao!
    
    func para(_ descricao: String) -> Self {
        leilao = Leilao(descricao: descricao)
        
        return self
    }
    
    func lance(_ usuario: Usuario, _ valor: Double) -> Self {
        leilao.propoe(lance: Lance(usuario, valor))
        
        return self
    }
    
    func constroi() -> Leilao {
        return leilao
    }
}
