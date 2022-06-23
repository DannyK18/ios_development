//
//  ContentView.swift
//  iExpense
//
//  Created by Daniel on 07.06.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @State  private var currency: Currency = .USD
    @State var amount = Amount(value: Decimal(), currency: .GBR)

    var body: some View {
        NavigationView {
            List {
                ForEach(amount.value) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .foregroundColor(item.amount <= 100 ? .green : item.amount > 100 && item.amount < 1000 ? .orange : .red)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
//                AddView(expenses: expenses)
                SwiftUIView(expenses: Expenses(), amount: Amount(value: Decimal(), currency: .GBR))
                
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    @State var amount = Amount(value: Decimal(), currency: .GBR)
    static var previews: some View {
        ContentView(expenses: Expenses(), amount: Amount(value: Decimal(), currency: .GBR))
    }
}
