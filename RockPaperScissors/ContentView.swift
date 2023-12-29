//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Santiago Gonzalez on 28/12/2023.
//

import SwiftUI

private var moves = ["✊","✋","✂️"]
private var movesToWin = ["✋","✂️","✊"]
private var movesToLose = ["✂️","✊","✋"]

struct ContentView: View {
    @State private var moveApp: Int = Int.random(in: 0...2)
    @State private var shouldWin: Bool = Bool.random()
    @State private var score: Int = 0
    @State private var chances: Int = 10
    @State private var showingScore = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("App Move: \(moves[moveApp])").font(.largeTitle)
            if shouldWin{
                Text("You should win").font(.headline)
            }
            else{
                Text("You should lost").font(.headline)
            }
                
            HStack(){
                ForEach(Array(moves.enumerated()), id: \.offset){ index,element in
                    Button("\(element.description)"){
                        toggle(index)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(.blue)
                    .clipShape(.capsule)
                    .foregroundColor(.white)
                    
                }
            }
            Text("Player Score: \(score)")
                .font(.largeTitle)
            
            Spacer()
            
            
            
        }
        .padding()
        
        .alert("The game is over", isPresented: $showingScore) {
                        Button("Continue", action: resetGame)
                    } message: {
                        Text("Your score is \(score)")
                    }
    }
    
    func toggle(_ move: Int){
        
        // the player tapped rock, the player was trying to win, and the app chose scissors, so add 1 point.
        
        
        if(chances != 0){
            //print("move :")
            //if(move == movesToWin.firstIndex(of: moves[move]))
            //print(moves[moveApp])
            
           
            if(shouldWin){
                if (movesToWin[moveApp] == moves[move]){
                    //print("sumo 1 punto")
                    score += 1
                    
                }
                else{
                    //print("perdi")
                }
            }
            else{
                if (movesToLose[moveApp] == moves[move]){
                    //print("sumo 1 punto")
                    score += 1
                }
            }
            //print(chances)
            shuffle()
            
        }
        else{
            showingScore = true
        }
        chances -= 1
        
        
        
    }
    func shuffle(){
        moveApp = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    func resetGame(){
        chances = 10
        score = 0
        showingScore = false
        shuffle()
    }
}

#Preview {
    ContentView()
}
