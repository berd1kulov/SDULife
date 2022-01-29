//
//  News.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

struct NewsCell: View {
    
    var news: News
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(news.title)
                    .font(Font.custom("Poppins-SemiBold", size: 15))
                Spacer()
                Text(news.date)
                    .font(Font.custom("Poppins-Light", size: 11))
            }
            Spacer()
            Image(news.image)
                .resizable()
                .frame(width: 162, height: 147, alignment: .center)
                .scaledToFill()
        }
        .frame( height: 147, alignment: .center)
    }
}

struct News_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(news: News(id: 0001, title: "Hackathon for freshmans", image: "hackathon", date: "22/10/2020"))
    }
}
