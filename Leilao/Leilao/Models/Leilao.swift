//
//  Leilao.swift
//  Leilao
//
//  Created by Marcos Jr on 30/04/21.
//

import Foundation

class Leilao {
    
    let descricao: String
    let imagem: String?
    var lances: [Lance]?
    
    init(descricao: String, imagem: String? = nil, lances: [Lance] = []) {
        self.descricao = descricao
        self.imagem = imagem
        self.lances = lances
    }
    
    func propoe(lance: Lance) {
        guard let listaLances = lances else { return }
        
        if podeDarLance(lance.usuario, listaLances) {
            lances?.append(lance)
        }
    }
    
    private func podeDarLance(_ usuario: Usuario, _ listaLances: [Lance]) -> Bool {
        return listaLances.count == 0 || ultimoLance(listaLances).usuario != usuario
            && quantidadeLancesDoUsuario(usuario) < 5
    }
    
    private func ultimoLance(_ lances: [Lance]) -> Lance {
        return lances[lances.count - 1]
    }
    
    private func quantidadeLancesDoUsuario(_ usuario: Usuario) -> Int {
        guard let listaLances = lances else { return 0 }
        var total = 0
        
        for lanceAtual in listaLances {
            if lanceAtual.usuario == usuario {
                total += 1
            }
        }
        
        return total
    }
}
