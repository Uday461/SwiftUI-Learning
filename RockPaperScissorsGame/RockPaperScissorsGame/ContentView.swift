//
//  ContentView.swift
//  RockPaperScissorsGame
//
//  Created by Banavath UdayKiran Naik on 14/10/25.
//

import SwiftUI

enum GameChoices: String {
    case Rock
    case Paper
    case Scissors
}

struct ContentView: View {
    var gameChoicesArr: [GameChoices] = [.Rock, .Paper, .Scissors]
    @State var randomChoice = Int.random(in: 0..<3)
    var resultArr = ["Lose", "Win"]
    @State var winFlag = true
    @State var score = 0
    var winArray: [GameChoices] = [.Paper, .Scissors, .Rock]
    var loseArray: [GameChoices] = [.Scissors, .Rock, .Paper]
    
    var body: some View {
        VStack(spacing: 50) {
            Text("\(score)")
                .fontWeight(.bold)
                .font(.system(size: 40))
            
            ButtonComponent(text: gameChoicesArr[randomChoice].rawValue, framSize: .init(height: 100, width: 150))
            ButtonComponent(text: resultArr[NSNumber(value: winFlag).intValue], framSize: .init(height: 50, width: 100), backGroundColor: winFlag ? .green : .red, foreGroundColor: .white)
            HStack {
                ButtonComponent(text: gameChoicesArr[0].rawValue, framSize: .init(height: 50, width: 100), backGroundColor: .gray) {
                    winFlag ? checkIfWin(selected: 0, randomChoice: randomChoice) : checkIfLose(selected: 0, randomChoice: randomChoice)
                    self.winFlag = !winFlag
                    self.randomChoice = Int.random(in: 0..<3)
                }
                
                ButtonComponent(text: gameChoicesArr[1].rawValue, framSize: .init(height: 50, width: 100), backGroundColor: .gray) {
                    winFlag ? checkIfWin(selected: 1, randomChoice: randomChoice) : checkIfLose(selected: 1, randomChoice: randomChoice)
                    self.winFlag = !winFlag
                    self.randomChoice = Int.random(in: 0..<3)
                }
                
                ButtonComponent(text: gameChoicesArr[2].rawValue, framSize: .init(height: 50, width: 100), backGroundColor: .gray) {
                    winFlag ? checkIfWin(selected: 2, randomChoice: randomChoice) : checkIfLose(selected: 2, randomChoice: randomChoice)
                    self.winFlag = !winFlag
                    self.randomChoice = Int.random(in: 0..<3)
                }
            }
        }
        .padding()
    }
    
    func checkIfWin(selected: Int, randomChoice: Int) {
        if gameChoicesArr[selected] == gameChoicesArr[randomChoice] { return }
        
        switch(gameChoicesArr[randomChoice]) {
        case .Rock:
            (winArray[randomChoice] == .Paper) ? (score += 1) : (score -= 1)
        case .Paper:
            (winArray[randomChoice] == .Scissors) ? (score += 1) : (score -= 1)
        case .Scissors:
            (winArray[randomChoice] == .Rock) ? (score += 1) : (score -= 1)
        }
    }
    
    func checkIfLose(selected: Int, randomChoice: Int) {
        if gameChoicesArr[selected] == gameChoicesArr[randomChoice] { return }
        
        switch(gameChoicesArr[randomChoice]) {
        case .Rock:
            (loseArray[randomChoice] == .Scissors) ? (score += 1) : (score -= 1)
        case .Paper:
            (loseArray[randomChoice] == .Rock) ? (score += 1) : (score -= 1)
        case .Scissors:
            (loseArray[randomChoice] == .Paper) ? (score += 1) : (score -= 1)
        }
    }
}

struct ButtonComponent: View {
    struct FrameSize {
        var height: CGFloat
        var width: CGFloat
    }
    
    var text: String
    var fontStyle: Font.Weight = .medium
    var framSize: ButtonComponent.FrameSize = .init(height: 75, width: 75)
    var backGroundColor: Color = .black
    var foreGroundColor: Color = .white
    var action: (() -> (Void))?
    
    var body: some View {
        Button(text) {
            action?()
        }
        .fontWeight(fontStyle)
        .frame(width: framSize.width, height: framSize.height)
        .foregroundStyle(foreGroundColor)
        .background {
            backGroundColor
        }
        .cornerRadius(20)
    }
}

#Preview {
    ContentView()
}
