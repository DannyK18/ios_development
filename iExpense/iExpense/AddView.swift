//
//  AddView.swift
//  iExpense
//
//  Created by Daniel on 07.06.2022.
//

//import SwiftUI
//
//struct AddView: View {
//    
//    @ObservedObject var expenses: Expenses
//    @Environment(\.dismiss) var dismiss
//    @State private var name = ""
//    @State private var type = "Personal"
//    @State private var amount = 0.0
//    @State private var currency: Currency = .USD
//    
//    let types = ["Buisiness", "Personal"]
//    
//    var body: some View {
//        NavigationView {
//            Form {
//                TextField("Name", text: $name)
//                
//                Picker("Type", selection: $type) {
//                    ForEach(types, id: \.self) {
//                        Text($0)
//                    }
//                }
//                HStack {
////                    TextField("Amount", value: $amount, format:  Locale.current.currencyCode ?? "USD")
////                        .id(currency.rawValue)
//                    Text(amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
//                        .keyboardType(.decimalPad)
//                    Picker("", selection: $currency) {
//                        ForEach(Currency.allCases, id: \.self) {
//                            Text($0.rawValue)
//                        }
//                    }
//                    .pickerStyle(.menu)
//                    Spacer()
//                }
//            }
//            .navigationTitle("Add new expense")
//            .toolbar {
//                Button("Save") {
//                    let item = ExpenseItem(name: name, type: type, amount: amount)
//                    expenses.items.append(item)
//                    dismiss()
//                }
//            }
//        }
//    }
//}
//
//enum Currency: String, CaseIterable, Identifiable {
//    var id: String { self.rawValue }
//    case UAN, CAD, EUR, GBR, USD
//}
//
//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView(expenses: Expenses())
//    }
//}

