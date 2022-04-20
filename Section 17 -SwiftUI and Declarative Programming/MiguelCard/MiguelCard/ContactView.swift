//
//  ContactView.swift
//  MiguelCard
//
//  Created by Miguel Solans on 17/03/2022.
//

import SwiftUI

struct ContactView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height:50)
            .foregroundColor(.white)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    
                    Text(text)
                }
            ).foregroundColor(.black)
            .padding(.all)
    }
}


struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(text: "+351 960 000 000", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
