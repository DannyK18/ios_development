//
//  SwiftUIView.swift
//  GuessTheFlagMyProject
//
//  Created by Daniel on 12.05.2022.
//

import SwiftUI
//struct FlagImage: ViewModifier {
//    var name: String
//    
//    func body(content: Content) -> some View {
//        content
//        
//        Image(name)
//        .renderingMode(.original)
//        .clipShape(Capsule())
//        .overlay(Capsule().stroke(Color.black, lineWidth: 2))
//        .shadow(color: .black, radius: 2)
//        }
//    }
//
//extension View {
//    func flagname(with name: String) -> some View {
//        modifier(FlagImage(name: name))
//    }
//}
struct SwiftUIView: View {
    var body: some View {
       Text("Hello world!")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
