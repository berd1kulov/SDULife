//
//  News.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsCell: View {

    var news: News
    let screenSize = UIScreen.main.bounds.size
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text(news.title)
                        .font(Font.custom("Poppins-SemiBold", size: 15))
                    Spacer()
                    Text(news.created_at)
                        .font(Font.custom("Poppins-Light", size: 11))
                }
                .padding(.init(top: 0, leading: 26, bottom: 0, trailing: 26))
                Spacer()
                WebImage(url: URL(string: news.images.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  news.images[0]))
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenSize.width/2-52, height: 147, alignment: .center)
                    .clipShape(Rectangle())
                    .padding(.init(top: 0, leading: 26, bottom: 0, trailing: 26))
                
            }
            Divider()
        }
        .shadow(color: Color.gray, radius: 0.5, x: 0, y: 0)
        .frame( height: 160, alignment: .center)
        .contentShape(Rectangle())
    }
}

//struct News_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsCell(news: News(id: 0001, author: "Some author", title: "Hackathon for freshmans", body: "Some text", likes: 0, status: 1, created_at: "11/11/2011", updated_at: "11/11/2011", images: ["hackathon"]))
//    }
//}
