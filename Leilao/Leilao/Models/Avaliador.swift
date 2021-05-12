//
//  Avaliador.swift
//  Leilao
//
//  Created by Marcos Jr on 30/04/21.
//

import Foundation

enum ErroAvaliador: Error {
    case leilaoSemLance(String)
}

class Avaliador {
    
    private var maiorDeTodos = Double.leastNonzeroMagnitude
    private var menorDeTodos = Double.greatestFiniteMagnitude
    private var maiores: [Lance] = []
    
    func avalia(leilao: Leilao) throws {
        
        if leilao.lances?.count == 0 {
            throw ErroAvaliador.leilaoSemLance("Não é possível avaliar um leilão sem lances!!")
        }
        
        guard let lances = leilao.lances else { return }
        
        for lance in lances {
            if lance.valor > maiorDeTodos {
                maiorDeTodos = lance.valor
            }
            
            if lance.valor < menorDeTodos {
                menorDeTodos = lance.valor
            }
        }
        
        pegaOsMaioresLancesNoLeilao(leilao)
    }
    
    func maiorLance() -> Double {
        return maiorDeTodos
    }
    
    func menorLance() -> Double {
        return menorDeTodos
    }
    
    func tresMaiores() -> [Lance] {
        return maiores
    }
    
    private func pegaOsMaioresLancesNoLeilao(_ leilao: Leilao) {
        guard let lances = leilao.lances else { return }
        
        maiores = lances.sorted(by: { lista1, lista2 in
            return lista1.valor > lista2.valor
        })
        
        let maioresLances = maiores.prefix(3)
        
        maiores = Array(maioresLances)
    }
}
