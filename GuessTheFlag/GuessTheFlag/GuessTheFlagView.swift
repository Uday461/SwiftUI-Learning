//
//  GuessTheFlagView.swift
//  GuessTheFlag
//
//  Created by Banavath UdayKiran Naik on 20/09/25.
//

import SwiftUI

struct GuessTheFlagView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Monaco", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var showTitle = ""
    @State private var score = 0
    @State private var questionNumber = 1
    
    var body: some View {
        ZStack {
            //   LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
            //       .ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                VStack(spacing: 20) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            questionNumber += 1
                        } label: {
                            Image(countries[number].lowercased())
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
            }
            .padding()
        }
        .alert(showTitle, isPresented: $showingScore) {
            if questionNumber == 8 {
                Button("Reset Game", action: reset)
            } else {
                Button("Continue", action: askQuestion)
            }
        } message: {
            Text("Question: \(questionNumber), Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            showTitle = "Correct"
            score += 1
        } else {
            showTitle = "Wrong!!"
            showTitle += " that's the flag of \(countries[number])"
            score -= 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        questionNumber = 1
        score = 0
    }
}

#Preview {
    GuessTheFlagView()
}
