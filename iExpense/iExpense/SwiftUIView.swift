//
//  SwiftUIView.swift
//  iExpense
//
//  Created by Daniel on 10.06.2022.
//

import SwiftUI

struct Amount {
    var value: Decimal
    var currency: Currency
}

struct SwiftUIView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
//    @State private var currency: Currency = .USD
    @State var amount1 = Amount(value: Decimal(), currency: .GBR)
    let types = ["Buisiness", "Personal"]

    var body: some View {
        
            NavigationView {
                Form {
                    TextField("Name", text: $name)
                    
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    CurrencyAmount(title: "Some label", amount: $amount1)
                                                .keyboardType(.decimalPad)
//                    HStack {
//                        TextField("Amount", value: $amount, format:  Locale.current.currencyCode ?? "USD")
//    //                        .id(currency.rawValue)
//                        Text(amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
//                        Picker("", selection: $currency) {
//                            ForEach(Currency.allCases, id: \.self) {
//                                Text($0.rawValue)
//                            }
//                        }
//                        .pickerStyle(.menu)
//                        Spacer()
//                    }
                }
                .navigationTitle("Add new expense")
                .toolbar {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
            }
        }
    }


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(expenses: Expenses(), amount1: Amount(value: Decimal(), currency: .GBR))
    }
}

struct CurrencyAmount: View {
    let title: String
    let prompt: String = ""
    @Binding var amount: Amount
    @State var currency: Currency = .GBR

    var body: some View {
        HStack {
            Spacer(minLength: 20)
            TextField(title, value: $amount.value, format: .currency(code: amount.currency.rawValue), prompt: Text(prompt))
            CurrencyPicker(selected: $currency)
            Spacer(minLength: 20)
        }
        .onChange(of: currency) { newValue in
            amount.currency =  newValue
        }
    }
}

struct CurrencyPicker: View {
    @Binding var selected: Currency
    let label = ""
    var body: some View {
        Picker(label, selection: $selected) {
            ForEach(Currency.allCases) {
                Text($0.rawValue)
                    .tag($0)
            }
        }
    }
}

    enum Currency: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        case UAN, CAD, EUR, GBR, USD
    }
