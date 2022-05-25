//
//  PrincipalViewModel.swift
//  AppFinanceiro
//
//  Created by ALUNO on 11/05/22.
//

import Foundation

class PrincipalViewModel:ObservableObject{
    @Published var valor:String = "0.00" {
        didSet{
            score = Double(valor) ?? (0.00)
        }
    }
    var score:Double = (0.00)
    var sqlite = SQLiteDatabase()
    var saldoBoard:[Entrada]
    
    init(){
        saldoBoard = sqlite.getEntradas()
        valor = sqlite.getSaldo()
        
    }
    func insertNewScore(score:Entrada){
        _ = sqlite.insertEntrada(entrada: score)
        saldoBoard = sqlite.getEntradas()
    }
}
