//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Marcos Jr on 11/05/21.
//

import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {
    
    private var joao: Usuario!
    private var maria: Usuario!
    private var jose: Usuario!
    private var leiloeiro: Avaliador!

    override func setUpWithError() throws {
        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
        leiloeiro = Avaliador()
    }

    override func tearDownWithError() throws {
    }
    
    func testDeveEntenderLancesEmOrdemCrescente() {
        // Cenario
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 1000.0))
        leilao.propoe(lance: Lance(joao, 2000.0))
        leilao.propoe(lance: Lance(jose, 3000.0))
        
        // Acao
        
        try? leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(3000.0, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderLeilaoComApenasUmLance() {
        let leilao = Leilao(descricao: "PS4")
        
        leilao.propoe(lance: Lance(joao, 1000.0))
        
        try? leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testDeveEncontrarOsTresMaioresLances() {
        let leilao = CriadorDeLeilao().para("PS4")
                        .lance(joao, 300.0)
                        .lance(maria, 400.0)
                        .lance(joao, 500.0)
                        .lance(maria, 600.0)
                        .constroi()
                
        
        try? leiloeiro.avalia(leilao: leilao)
        
        let listaLances = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(600.0, listaLances[0].valor)
        XCTAssertEqual(500.0, listaLances[1].valor)
        XCTAssertEqual(400.0, listaLances[2].valor)
    }
    
    func testDeveIgnorarLeilaoSemNenhumLance() {
        let leilao = CriadorDeLeilao().para("PS4").constroi()
        
        XCTAssertThrowsError(try leiloeiro.avalia(leilao: leilao),
                             "Não é possível avaliar um leilão sem lances!!") { (error) in
            print(error.localizedDescription)
        }
    }
}
