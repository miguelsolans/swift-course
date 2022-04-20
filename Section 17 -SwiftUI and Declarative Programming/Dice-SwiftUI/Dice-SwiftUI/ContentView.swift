//
//  ContentView.swift
//  Dice-SwiftUI
//
//  Created by Miguel Solans on 18/03/2022.
//

import SwiftUI

struct ContentView: View {
    // In SwiftUI we don't need a mutating function to assign values, we ca use @State for that
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        
        
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(1, contentMode: .fill)
            
            VStack {
                Image("diceeLogo")
                
                Spacer()
                
                HStack {
                    DiceView(number: self.leftDiceNumber)
                    DiceView(number: self.rightDiceNumber)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                } label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
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

struct DiceView: View {
    let number : Int;
    
    var body: some View {
        Image("dice\(number)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 100, height: 100)
            .padding()
    }
}
