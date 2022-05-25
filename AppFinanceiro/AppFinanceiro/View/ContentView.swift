//
//  ContentView.swift
//  AppFinanceiro
//
//  Created by ALUNO on 04/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var goToPrincipal = false
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center) {
                // Bleeds into NavigationView
                Rectangle()
                    .frame(height: 0)
                    .background(Color("AmareloQueimado"))
                Spacer()
                Text("Bem-vindo ao app de finanças")
                //Divider()
                Spacer()
                Spacer()
                Button(action: {
                    goToPrincipal = true
                }, label: {
                    Text("Entrar")
                        .padding(.horizontal, 20.0)
                        .padding(.vertical, 10.0)
                        .foregroundColor(Color.white)
                        .background(Color("Ciano")
                        .cornerRadius(6)
                        )
                })
                Spacer()
                NavigationLink(destination: Principal(), isActive: $goToPrincipal) { }
            }
            // parte de cima
//            .background(Color("CinzaClaro"))
            .navigationTitle(Text("Weber's Bank").foregroundColor(Color("Ciano")))
        }
    .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
