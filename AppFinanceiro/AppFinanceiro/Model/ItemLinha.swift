//
//  ItemLinha.swift
//  AppFinanceiro
//
//  Created by ALUNO on 11/05/22.
//

import Foundation

struct ItemLinha: View {
    var position:Int
    var scoreEntry:ScoreEntry
    var body: some View {
        HStack{
            Text("\(position))")
            Spacer()
            Text(scoreEntry.name)
            Spacer()
            Text("\(scoreEntry.score)")
        }
    }
}
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(position: 1, scoreEntry: ScoreEntry(name: "Mark",score: 333))
            .previewLayout(.sizeThatFits)
    }
}
