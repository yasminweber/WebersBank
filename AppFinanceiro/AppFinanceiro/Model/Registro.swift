//
//  Registro.swift
//  AppFinanceiro
//
//  Created by ALUNO on 11/05/22.
//

import Foundation

struct Registro: View {
    var position:Int
    var entrada:Entrada
    var body: some View {
        HStack{
            Text("\(position))")
            Spacer()
            Text(entrada.description)
            Spacer()
            Text("\(entrada.value)")
        }
    }
}
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(position: 1, scoreEntry: ScoreEntry(name: "Mark",score: 333))
            .previewLayout(.sizeThatFits)
    }
}
