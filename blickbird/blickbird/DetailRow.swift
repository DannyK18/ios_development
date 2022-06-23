//
//  ContentView.swift
//  blickbird
//
//  Created by Daniel on 14.06.2022.
//

import SwiftUI

struct DetailRow: View {
    let contact: Contact
    
    var body: some View {
        VStack {
            Image(contact.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .shadow(radius: 3)
            Text(contact.name)
                .font(.title)
                .fontWeight(.medium)
            
            Form {
                HStack {
                    Text("Phone")
                    Spacer()
                    Text(contact.phone)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                
                HStack {
                    Text("Email")
                    Spacer()
                    Text(contact.email)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                HStack {
                    Text("Address")
                    Spacer()
                    Text(contact.address)
                        .foregroundColor(.gray)
                        .font(.callout)
                        .frame(width: 180)
                }
                Section {
                    Button(action: {
                        print("Send message")
                    }) {
                        Text("Send message")
                    }
                    Button(action: {
                        print("Call")
                    }) {
                        Text("Call")
                            .foregroundColor(.green)
                    }
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(contact: contacts[0])
    }
}

