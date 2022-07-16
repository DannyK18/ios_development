//
//  ContentView.swift
//  myProjectList
//
//  Created by Daniel on 22.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    let articles = [
        Row(author: "ALEXEY NAUMOV", image: "state-management", text: "The Comprehensive Guide to the State Managment in IOS", description: "There are many chalanges in software development, but there is one beast that tends to screw things up much more often than the others: the problem of app`s state management and data propagation.", rating: 5),
        Row(author: "Gabriel THEODOROPOULOS", image: "protocols", text: "Using Swift Protocols to Manage App Configuration", description: "Hello and welcome to a new tutorial! One of the most common concepts met and used in Swift by all developers is protocols, and I don’t think there’s even one developer who doesn’t know about them.", rating: 4),
        Row(author: "Gabriel THEODOROPOULOS", image: "swiftui-button", text: "Drawing a Border with Rounded Corners", description: "Today we are going to focus on a commonly used family of controls which are vital to every application. Their primary purpose is to gather user input as well as to display certain message types to users. We are going to talk about text controls.", rating: 3),
        Row(author: "Andrew THEODOROPOULOS", image: "natural-language-api", text: "Building a Simple Text Editing App", description: "There are many chalanges in software development, but there is one beast that tends to screw things up much more often than the others: the problem of app`s state management and data propagation.", rating: 2),
        Row(author: "Isaac THEODOROPOULOS", image: "macos-programming", text: "Building a Simple Text Editing App", description: "Today we are going to focus on a commonly used family of controls which are vital to every application. Their primary purpose is to gather user input as well as to display certain message types to users. We are going to talk about text controls.", rating: 2),
        Row(author: "Lawrence Tan", image: "flutter-app", text: "Building a Flutter App with Complex UI", description: "Hello there! Welcome to the second tutorial of our Flutter series. In the last tutorial, you learned the basics of building a Flutter app. So if you have not gone through it, please take a pit stop here, visit it first before proceeding with this tutorial.", rating: 1)
    ]
    
    var body: some View {
        List(articles) { article in
            ComplexRow(row: article)
        }
    }
}


struct Row: Identifiable {
    var author: String
    var image: String
    var text: String
    var description: String
    var rating: Int
    var id = UUID()
}

struct ComplexRow: View {
    var row: Row
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3.0) {
            
            Image(row.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Text(row.text)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .padding(.bottom, 1)
            
            Text("BY \(row.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 1)
            
            HStack(spacing: 3) {
                ForEach(1...(row.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
            Text(row.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
