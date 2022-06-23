//
//  ContentView.swift
//  TipCalculator
//
//  Created by Daniel on 17.04.2022.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//
//
//    }
//}

struct ContentView: View {
   @State private var name = ""
    
   var body: some View {
       
    Form {
         TextField("Enter your name", text: $name)
        Text("Your name is \(name)")

         }
       
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
