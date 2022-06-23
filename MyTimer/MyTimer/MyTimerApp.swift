//
//  MyTimerApp.swift
//  MyTimer
//
//  Created by Daniel on 15.06.2022.
//

import SwiftUI

@main
struct MyTimerApp: App {
    @ObservedObject var timerManager = TimerManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(timerManager: timerManager)
        }
    }
}
