//
//  ClubsCell.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ClubsCell: View {
    
    var club: Club = MockData.sampleClub
    var body: some View {
        HStack{
            WebImage(url: URL(string: club.images.isEmpty ? DefaultMock.thumbinalImage :  (MockData.imageBase + club.images[0].path)))
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 85, alignment: .center)
                .clipShape(Rectangle())
            
            VStack(alignment: .leading){
                Text(club.name)
                    .font(Font.custom("Poppins-SemiBold", size: 17))
                
                Spacer()
                
                Text(club.description)
                    .font(Font.custom("Poppins-Regular", size: 11))
                
                Text("\(club.members) members")
                    .font(Font.custom("Poppins-Light", size: 11))
                    .opacity(0.5)
            }
            .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
            Spacer()
        }
        .frame(height: 85)
        .shadow(color: Color.gray, radius: 0.3, x: 0, y: 0)
    }
}

struct ClubsCell_Previews: PreviewProvider {
    static var previews: some View {
        ClubsCell()
    }
}
