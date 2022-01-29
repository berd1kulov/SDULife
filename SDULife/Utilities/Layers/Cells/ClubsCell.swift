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
            WebImage(url: URL(string: club.images.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  (MockData.imageBase + club.images[0].path)))
                .resizable()
                .frame(width: 90, height: 85, alignment: .center)
                .scaledToFill()
            
            VStack(alignment: .leading){
                Text(club.name)
                    .font(Font.custom("Poppins-SemiBold", size: 17))
                
                Spacer()
                
                Text(club.chat)
                    .font(Font.custom("Poppins-Regular", size: 11))
                
                Text("\(club.members)")
                    .font(Font.custom("Poppins-Light", size: 11))
                    .opacity(0.5)
            }
            .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
            Spacer()
        }
        .frame(height: 85)
    }
}

struct ClubsCell_Previews: PreviewProvider {
    static var previews: some View {
        ClubsCell()
    }
}