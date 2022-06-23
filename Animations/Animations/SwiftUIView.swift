//
//  SwiftUIView.swift
//  Animations
//
//  Created by Daniel on 04.06.2022.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}
struct SwiftUIView: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@twostraws")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
