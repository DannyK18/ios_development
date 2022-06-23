//
//  ContentView.swift
//  BetterRest
//
//  Created by Daniel on 13.05.2022.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State  private var wakeUp = defaultWakeTime
    @State  private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMesage = ""
    @State private var showingAlert = false

    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    
    var recommendedBadTime: String {
        calculateBedtime()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                }
                Section {
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                Section(header:  Text("Daily coffee intake")) {
                    //Stepper(value: $cupsOfCoffee, in: 1...20) {
                                       //      Text("\(cupsOfCoffee) \(cupsOfCoffee == 1 ? "Cup" : "Cups")")
                                       //                    }
//                    .font(.headline) {
                    Picker("Number of cups", selection: $coffeeAmount) {
                        ForEach(1..<21,  id: \.self) {
                            Text($0 >  1 ? "\($0) cups" : "\(coffeeAmount) cup")
                           
//                        }
                    }
                }
            }
                Section(header: Text("Your recommended bed time is...")) {
                    Text(recommendedBadTime)
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor.systemOrange))
                }
            .navigationBarTitle("BetterRest")
//            .toolbar {
//              Button("Calcualte", action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showingAlert) {
//                Button("OK") { }
//            } message: {
//                Text(alertMesage)
           }
        }
    }

    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleeepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
//            alertTitle = "Your ideal bedtime is..."
//           return sleepTime.formatted(date: .omitted, time: .shortened)
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            
            return  formatter.string(from: sleepTime)
        } catch {

            return "Error"
    //            alertTitle = "Error"
//            alertMesage = "Sorry, there was a problem calculating  your bedtime."
        }
//            showingAlert = true
     }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
