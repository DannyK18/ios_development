//
//  Expenses.swift
//  Animations
//
//  Created by Daniel on 04.06.2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
