//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Frank Grullon on 16/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var options = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var winOrLose = ["Win", "Lose"].shuffled()
    
    @State private var userScore = 0
    @State private var attempts = 0
    
    @State private var showResult = false
    @State private var altText = ""
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .secondary], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        VStack{
        
            
            Text("This time you have to \(Text(winOrLose[0]).foregroundColor(winOrLose[0] ==  "Win" ? .white : .red ).bold()) to win")  .foregroundStyle(.black)
                .font(.subheadline.weight(.heavy))
            
            Text("Choose a Option")
                .foregroundStyle(.white)
                .font(.subheadline.weight(.heavy))
            
            ForEach(options.sorted(), id: \.self){ option in
                Button{
                    selectOne(option)
                } label :{
                    Text(option)
                }   
                .buttonBorderShape(.roundedRectangle)
                .buttonStyle(.borderedProminent)
                .bold()
            }
        }
        .alert(scoreTitle, isPresented: $showResult){
            if(attempts == 10){
                Button("Restart", action: restart)
            } else {
                Button("Continue", action: nextQuestion)
            }
        } message : {
            if(attempts == 8){
                Text("Your score is \(userScore) / \(attempts)")
            } else {
                Text(altText)
            }
        }
        }

    
    }
    
    func selectOne (_ selection : String ) {
        
        if(winOrLose[0] == "Win"){
            if(options[0] == "Rock" && selection == "Paper"){
                userScore += 1
                scoreTitle = "Correct"
                altText = "Correct! The correct answer was indeed \(selection)"
            }else if(options[0] == "Paper" && selection == "Scissors"){
                userScore += 1
                scoreTitle = "Correct"
                altText = "Correct! The correct answer was indeed \(selection)"
            }else if(options[0] == "Scissors" && selection == "Rock"){
                userScore += 1
                scoreTitle = "Correct"
                altText = "Correct! The correct answer was indeed \(selection)"
            }else {
                userScore -= 1
                scoreTitle = "Wrong"
                altText = "Wrong! The correct answer was indeed \("no ready yet")"
            }
        }else {
            if(options[0] == "Rock" && selection == "Scissors"){
                userScore += 1
                scoreTitle = "Correct"
                altText = "Correct! The correct answer was indeed \(selection)"
            }else if(options[0] == "Paper" && selection == "Rock"){
                userScore += 1
                scoreTitle = "Correct"
                altText = "Correct! The correct answer was indeed \(selection)"
            }else if(options[0] == "Scissors" && selection == "Paper"){
                userScore += 1
                scoreTitle = "Correct"
                altText = "Correct! The correct answer was indeed \(selection)"
            }else {
                userScore -= 1
                scoreTitle = "Wrong"
                altText = "Wrong! The correct answer was indeed \("no ready yet")"
            }
            
        }

        attempts += 1
        showResult = true

  
    }
    
    func nextQuestion(){
        options.shuffle()
        winOrLose.shuffle()
    }
    
    func restart(){
        options.shuffle()
        winOrLose.shuffle()
        showResult = false
        attempts = 0
    }
    
}


#Preview {
    ContentView()
}
