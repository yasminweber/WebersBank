//
//  Entrada.swift
//  AppFinanceiro
//
//  Created by ALUNO on 11/05/22.
//

import Foundation

struct Entrada{
    internal init(description: String, value: Double) {
        self.description = description
        self.value = value
    }
    
    var description:String
    var value:Double
}
