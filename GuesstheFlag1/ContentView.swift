//
//  ContentView.swift
//  GuesstheFlag1
//
//  Created by Jiri Matousek on 29.04.2023.
//

import SwiftUI



struct ContentView: View {
    @State private var showingScore = false
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 40){
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                VStack(spacing: 40) {
                    ForEach(0..<3) { number in
                        Button {
                            flagtapped(number)
                            
                        } label: { Image(countries[number])
                            .renderingMode(.original)}
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)}
        message: {Text("Your score is \(score)")
            }
        }
        
    }
    func flagtapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score = +1
        } else { scoreTitle = "Wrong!"}
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
