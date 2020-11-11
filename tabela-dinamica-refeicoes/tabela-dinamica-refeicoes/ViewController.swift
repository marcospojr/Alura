//
//  ViewController.swift
//  tabela-dinamica-refeicoes
//
//  Created by Marcos Jr on 11/11/20.
//

import UIKit

class ViewController: UITableViewController {
    
    let refeicoes = ["churros", "macarrão", "pizza"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("table view controller foi carregado")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao
        
        return celula
    }

}

