//
//  ContentView.swift
//  GuesstheFlag1
//
//  Created by Jiri Matousek on 29.04.2023.
//

import SwiftUI



struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 40){
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }
                VStack {
                    ForEach(0..<3) { number in
                        Button {
                            //Flag was tapped
                            
                        } label: { Image(countries[number])
                            .renderingMode(.original)}
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
