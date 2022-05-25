//
//  Principal.swift
//  AppFinanceiro
//
//  Created by ALUNO on 04/05/22.
//

import SwiftUI

struct Principal: View {
    @State var goToNewData = false
    @EnvironmentObject var dataModel:PrincipalViewModel
    @State private var showValores = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            // Bleeds into NavigationView
//            Rectangle()
//
//                //.position(x: 0, y: 0)
//                .frame(height: 90.0)
//                .background(Color("AmareloQueimado"))
//                .foregroundColor(Color("AmareloQueimado"))
            
            HStack(alignment: .center) {
                Text("Saldo").foregroundColor(Color.white)
                Spacer()
                Text("R$ " + dataModel.valor).foregroundColor(Color.white)
            }
            .padding(.top, 25)
            .padding(.bottom, 10)
            .padding(.horizontal, 20.0)
            .frame(maxWidth: .infinity)
            .background(Color("AmareloQueimado"))
            //.background(Color("Ciano"))
            
            HStack() {
                Button(action: {
                    print("Lançar valor")
                    goToNewData = true
                }, label: {
                    Text("Lançar valor")
                        .padding(.vertical, 7.0)
                        .padding(.horizontal, 10.0)
                        .foregroundColor(Color.white)
                        .frame(width: nil)
                        .background(Color("AmareloQueimadoQueimado"))
                        .cornerRadius(5)
                })
                .padding(.leading)
            }
            .padding(.bottom, 5.0)
            .frame(maxWidth: .infinity)
            .background(Color("AmareloQueimado"))
            
            
            VStack {
                let columns = [
                    GridItem(.flexible())
                ]

                LazyVGrid(columns: columns){
                    ForEach (dataModel.saldoBoard.indices , id: \.self){ i in
                        Registro(entrada: dataModel.saldoBoard[i])
                    }
                    
                    
                }
            }
            .padding(.top, 15.0)
            .padding(.horizontal, 20.0)
            
            
            Spacer()
            
            NavigationLink(destination: NewData(), isActive: $goToNewData) { }
        }
        .navigationBarHidden(true)
    }
}

struct Principal_Previews: PreviewProvider {
    static var previews: some View {
        Principal()
    }
}
