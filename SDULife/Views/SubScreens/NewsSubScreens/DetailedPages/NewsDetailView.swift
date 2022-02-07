//
//  NewsDetailView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailView: View {
    @State private var isLiked: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var news: News = News(id: 0001, author: "Some author", title: "Nauryz fest", body: "Some text", likes: 0, status: 1, created_at: "11/11/2011", updated_at: "11/11/2011", images: ["hackathon"])
    var body: some View {
        GeometryReader{ geom in
            VStack(alignment:.leading){
                ScrollView{
                    VStack(alignment: .leading, spacing: 10){
                        
                        HStack{
                            Text(news.created_at)
                                .font(.system(size: 10))
                                .opacity(0.5)
                            Spacer()
                        }
                        Text(news.title)
                            .font(.system(size: 24))
                            .bold()
                        WebImage(url: URL(string: news.images.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  "https://sdulife.abmco.kz/\(news.images[0])"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: geom.size.width-30, height: 331, alignment: .center)
                            .clipShape(Rectangle())
                            
                        
                        Text(news.body)
                            .font(.system(size: 15))
                            .opacity(0.8)
                        
                        Divider()
                        
                        HStack{
                            Label("Like", systemImage: isLiked ? "heart.fill" : "heart")
                                .onTapGesture {
                                    isLiked.toggle()
                                }
                            Label("Comment", systemImage: "bubble.left")
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                        }
                        .opacity(0.7)
                        Spacer()
                    }
                }
                .padding(.init(top: 0, leading: 17, bottom: 0, trailing: 17))
                .navigationBarTitle("News", displayMode: .inline)
            }
        }
    }
}


struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView()
    }
}
