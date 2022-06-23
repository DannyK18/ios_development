//
//  ContentView.swift
//  TabViewproject
//
//  Created by Daniel on 07.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Hello World")
            .tabItem {
                Label("Home", systemImage: "house")            }
        Text("Profile View")
                   .tabItem {
                       Label("Profile", systemImage: "person.circle.fill")
                   }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
