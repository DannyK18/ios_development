//
//  blickbirdApp.swift
//  blickbird
//
//  Created by Daniel on 14.06.2022.
//

import SwiftUI

@main
struct blickbirdApp: App {
    var body: some Scene {
        WindowGroup {
            DetailRow(contact: contacts[0])
        }
    }
}
