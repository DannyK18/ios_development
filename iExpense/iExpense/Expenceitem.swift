//
//  Expenceitem.swift
//  iExpense
//
//  Created by Daniel on 07.06.2022.
//

import Foundation

struct ExpenseItem : Identifiable, Codable{
    var id =  UUID()
    let name: String
    let type: String
    let amount: Double
    
}
