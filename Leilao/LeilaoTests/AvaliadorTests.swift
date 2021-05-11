//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Marcos Jr on 11/05/21.
//

import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testDeveEntenderLancesEmOrdemCrescente() {
        // Cenario
        
        let joao = Usuario(nome: "Joao")
        let jose = Usuario(nome: "Jose")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 1000.0))
        leilao.propoe(lance: Lance(joao, 2000.0))
        leilao.propoe(lance: Lance(jose, 3000.0))
        
        // Acao
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(3000.0, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderLeilaoComApenasUmLance() {
        let joao = Usuario(nome: "João")
        let leilao = Leilao(descricao: "PS4")
        
        leilao.propoe(lance: Lance(joao, 1000.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testDeveEncontrarOsTresMaioresLances() {
        let joao = Usuario(nome: "João")
        let maria = Usuario(nome: "Maria")
        let leilao = Leilao(descricao: "PS4")
        
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(maria, 400.0))
        leilao.propoe(lance: Lance(joao, 500.0))
        leilao.propoe(lance: Lance(maria, 600.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        let listaLances = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(600.0, listaLances[0].valor)
        XCTAssertEqual(500.0, listaLances[1].valor)
        XCTAssertEqual(400.0, listaLances[2].valor)
    }
}
