//
//  ContentView.swift
//  project4
//
//  Created by Daniel on 12.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = Date()
    @State private var shouldSendNewsletter = false
    @State private var numberOfLikes = 0
    @State private var showKeyboard = true

    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("Personal information")) {
                    TextField("First Name", text: $firstName)
                    TextField("First Name", text: $lastName)
                    DatePicker("Birthdate", selection: $birthDate, displayedComponents: .date)
                }
                Section(header: Text("Actions")) {
                    Toggle("Send newsletter", isOn: $shouldSendNewsletter)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number of likes", value: $numberOfLikes, in: 1...100)
                    Text("This video has \(numberOfLikes) likes")
                    Link("Terms of Service", destination: URL(string: "https://seanallen.co")!)
                }
            }
            .accentColor(.red)
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Spacer()
                    Button("Done", role: .cancel) {
                        showKeyboard = false
                    }
                    //label: {
//                        Image(systemName: "keyboard.chevron.compact.down")
//                    }
                }
                                 
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
