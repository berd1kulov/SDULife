//
//  ClubNewsCell.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ClubNewsCell: View {
    
    var clubPost: ClubNews = ClubNews(id: 0, club_id: 0, title: "Some title", body: "Some text", created_at: "11/11/1111", updated_at: "11/11/1111", images: [])
    var body: some View {
        HStack{
            WebImage(url: URL(string: clubPost.images.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  "https://sdulife.abmco.kz/\(clubPost.images[0].path)"))
                .resizable()
                .frame(width: 85, height: 85, alignment: .center)
                .scaledToFit()
            VStack(alignment:.leading){
                Text(clubPost.title)
                Spacer()
                Text(clubPost.created_at)
                    .font(.system(size: 13))
                    .opacity(0.5)
            }
            Spacer()
        }
        .frame(height: 85)
    }
}

struct ClubNewsCell_Previews: PreviewProvider {
    static var previews: some View {
        ClubNewsCell()
    }
}
