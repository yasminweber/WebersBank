//
//  NewData.swift
//  AppFinanceiro
//
//  Created by ALUNO on 04/05/22.
//

import SwiftUI

struct NewData: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = .white
    }
    
    @State var description = ""
    @State var value = ""
    @EnvironmentObject var dataModel:PrincipalViewModel
    
    @State var goToPrincipal = false
    
    var body: some View {
        VStack(alignment: .center) {
            Rectangle()
                .frame(height: 0)
                .background(Color("AmareloQueimado"))
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Insira a descrição do valor:")
                TextField("Descrição", text: $description)
                    .padding(.leading, 19.0)
                    .frame(width: 250.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray, lineWidth: 1))
                    .background(Color.white)
                Text("Insira o valor:")
                TextField("Valor", text: $value)
                    .padding(.leading, 19.0)
                    .frame(width: 250.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray, lineWidth: 1))
                    .background(Color.white)
            }
            
            Spacer()
            
            HStack(alignment: .center, spacing: 25.0) {
                Button(action: {
                    print("Despesa")
                    
                    let valorDespesa = Double(value) ?? 0
                    let saldo = Double(dataModel.valor) ?? 0
                    let resultadoSubtracao = String(saldo - valorDespesa)
                    
                    dataModel.valor = resultadoSubtracao
                    
                    let valorTabela = Double(valorDespesa * -1)
                    
                    print("valor receita" , valorTabela)
                    
                    self.dataModel.insertNewScore(score: Entrada(description: description, value: valorTabela))
                    
                    goToPrincipal = true
                }, label: {
                    Text("Despesa")
                        .padding(.horizontal, 20.0)
                        .padding(.vertical, 10.0)
                        .foregroundColor(Color.white)
                        .background(Color("Bordô"))
                        .cornerRadius(10)
                })
                
                Button(action: {
                    print("Receita")
                    let valorReceita = Double(value) ?? 0
                    let saldo = Double(dataModel.valor) ?? 0
                    let resultadoAdicao = String(saldo + valorReceita)
                    print("valor receita" , valorReceita)
                    print("saldo" , saldo)
                    print("resultado" , resultadoAdicao)
                    
                    dataModel.valor = resultadoAdicao

                    self.dataModel.insertNewScore(score: Entrada(description: description, value: valorReceita))

                    goToPrincipal = true
                }, label: {
                    Text("Receita")
                        .padding(.horizontal, 20.0)
                        .padding(.vertical, 10.0)
                        .foregroundColor(Color.white)
                        .background(Color("Verde"))
                        .cornerRadius(10)
                })
            }
            
            Spacer()
            NavigationLink(destination: Principal(), isActive: $goToPrincipal) { }
        }
        // parte de cima
        //.background(Color("CinzaClaro"))
    }
}

struct NewData_Previews: PreviewProvider {
    static var previews: some View {
        NewData()
    }
}
