//
//  AppFinanceiroApp.swift
//  AppFinanceiro
//
//  Created by ALUNO on 04/05/22.
//

import SwiftUI

@main
struct AppFinanceiroApp: App {
    @StateObject var dataModel = PrincipalViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(dataModel)
        }
    }
}
