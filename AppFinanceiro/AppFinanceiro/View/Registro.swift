//
//  Registro.swift
//  AppFinanceiro
//
//  Created by ALUNO on 11/05/22.
//

import SwiftUI

struct Registro: View {
    var entrada:Entrada
    var body: some View {
        if (entrada.value < 0) {
            HStack{
                Text(entrada.description)
                Spacer()
                Text("R$ \(entrada.value, specifier: "%.2f")")
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 6.0)
            .background(Color("BordôClaro"))
            .cornerRadius(6.0)
        } else {
            HStack{
                Text(entrada.description)
                Spacer()
                Text("R$ \(entrada.value, specifier: "%.2f")")
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 6.0)
            .background(Color("VerdeClaro"))
            .cornerRadius(6.0)
        }
        
    }
}

struct Registro_Previews: PreviewProvider {
    static var previews: some View {
        Registro(entrada: Entrada(description: "Weber",value: 1000.0))
            .previewLayout(.sizeThatFits)
    }
}
