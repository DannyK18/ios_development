//
//  ContentView.swift
//  GuessTheFlagMyProject
//
//  Created by Daniel on 05.05.2022.
//

import SwiftUI
struct FlagImage: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}


struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var score: Int = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
//            RadialGradient(stops: [
//                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
//                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
//            ], center: .top, startRadius: 200, endRadius: 400)
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            VStack {
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
        VStack(spacing: 15) {
        VStack {
               Text("Tap the flag of")
                .foregroundStyle(.secondary)
                .font(.subheadline.weight(.heavy))
               Text(countries[correctAnswer])
                .font(.largeTitle.weight(.semibold))
           }
            ForEach(0..<3) { number in
                Button(action: {
                    flagTapped(number)
                    
                })  {
                    FlagImage(imageName: self.countries[number])
                        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: (number == self.correctAnswer) ? 1 : 0, z: 0))
                        .animation(.easeInOut(duration: 2))
                        .opacity(self.showingScore && number != self.correctAnswer ? 0.25 : 1.0)
//                    FlagImage(name: countries[number])
//                        flagname(with: countries[number])
                      
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
      }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            animationAmount += 360
        } else {
            if score > 0{
            score -= 1
        }
            scoreTitle = "Wrong! That's flag of \(countries[number])"
    }
       showingScore = true
       
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
