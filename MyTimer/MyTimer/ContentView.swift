//
//  ContentView.swift
//  MyTimer
//
//  Created by Daniel on 15.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State var timerMode: TimerMode = .initial
    @State var selectedPickerIndex = 0
    @ObservedObject var timerManager: TimerManager
    
    let availableMinutes = Array(1...59)
    
    var body: some View {
        NavigationView {
            VStack {
                Text(timerManager.secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))
                    .font(.system(size: 80))
                    .padding(.top,80)
                Image(systemName: timerManager.timerMode == .running ? "play.circle.fill" : "pause.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.orange)
                
                    .onTapGesture(perform: {
                        if timerManager.timerMode == .initial {
                            timerManager.setTimerLength(minutes: availableMinutes[selectedPickerIndex]*60)
                        }
                        timerManager.timerMode == .running ? timerManager.pause() : timerManager.start()
                    })
                if timerManager.timerMode == .paused {
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40)
                        .onTapGesture(perform: {
                            timerManager.reset()
                        })
                }
                if timerManager.timerMode == .initial {
                    Picker("", selection: $selectedPickerIndex, content: {
                        ForEach(0..<availableMinutes.count) {
                            Text("\(availableMinutes[$0]) min")
                        }
                    })
                        .pickerStyle(.wheel)
                }
            }
            .navigationTitle("MyTimer")
        }
    }
}

enum TimerMode {
    case running
    case paused
    case initial
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(timerManager: TimerManager())
    }
}
