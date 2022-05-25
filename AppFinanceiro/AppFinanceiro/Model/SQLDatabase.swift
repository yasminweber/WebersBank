//
//  SQLDatabase.swift
//  AppFinanceiro
//
//  Created by ALUNO on 11/05/22.
//

import Foundation
import SQLite

class SQLiteDatabase{
    var db:Connection?
    
    let table = Table("Balanço")
    var saldo = Expression<Double>("saldo")
    
    let id = Expression<Int64>("id")
    let description = Expression<String>("description")
    let value = Expression<Double>("value")
    
    init(){
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            db = try Connection("\(path)/saldo1.sqlite3")
            //try db?.run(table.delete())
            //return
            try db?.run(table.create(ifNotExists: true){
                t in
                t.column(id,primaryKey: .autoincrement)
                t.column(description)
                t.column(value)
            })
        }catch{
            print(error)
        }
    }
    
    func insertEntrada(entrada:Entrada) -> Bool{
        guard let db = db else{
            return false
        }
        do{
            let rowId = try db.run(table.insert(
                description <- entrada.description,
                value <- entrada.value
            ))
            if rowId > 0{
                return true
            }
        }catch{
            print(error)
        }
        return false
    }
    
    func getEntradas() -> [Entrada]{
        var valores = [Entrada]()
        if let db = db{
            do{
                for row in try db.prepare(table.select(description,value)){
                    valores.append(Entrada(description: row[description], value: row[value]))
                }
            }catch{
                print(error)
            }
        }
        return valores
    }
    
    func getSaldo() -> String{
        var saldo = Double(0)
        var valores = getEntradas().forEach{ e in
            saldo += e.value
        }
        
        return String(saldo)
    }
}
