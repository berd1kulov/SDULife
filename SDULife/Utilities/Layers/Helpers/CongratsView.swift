//
//  CongratsView.swift
//  SDULife
//
//  Created by Dias Berdikul on 04.02.2022.
//

import SwiftUI

struct CongratsView: View {
    
    let screenSize = UIScreen.main.bounds.size
    var body: some View {
        VStack{
            Spacer()
            Image("check-circle")
            Text("Congrats!")
                .font(Font.custom("Poppins-Regular", size: 24))
            Text("Your announcement was placed successfully!")
                .font(Font.custom("Poppins-Regular", size: 13))
                .opacity(0.5)
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Back to menu")
                    .frame(width: screenSize.width-50, height: 50)
                    .foregroundColor(.white)
                    .background(Color.brandPrimary)
                    .padding()
            })
        }
    }
}

struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView()
    }
}
