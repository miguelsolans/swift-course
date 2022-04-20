//
//  ContentView.swift
//  I Am Rich
//
//  Created by Miguel Solans on 17/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("I Am Rich")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                .foregroundColor(.white)
                
                Image("diamond")
                    .resizable().aspectRatio(1, contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                

            }
        }
        
    }
}


// Renders a Preview of the ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        // We can change the preview device by doing:
        // .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
