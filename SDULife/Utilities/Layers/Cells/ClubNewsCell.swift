//
//  ClubNewsCell.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct ClubNewsCell: View {
    var body: some View {
        HStack{
            Image("no-image")
                .resizable()
                .frame(width: 85, height: 85, alignment: .center)
            VStack(alignment:.leading){
                Text("Сhess tournament in SDU will be on 25 March 2021. Participation is ...")
                Spacer()
                Text("4h ago")
                    .font(.system(size: 13))
                    .opacity(0.5)
            }
        }
        .frame(height: 85)
    }
}

struct ClubNewsCell_Previews: PreviewProvider {
    static var previews: some View {
        ClubNewsCell()
    }
}
