//
//  ClubHeadDetailedView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI
struct ClubPostDetailedView: View {
//    @State private var isLiked: Bool = false
    var post:ClubNews  = ClubNews(id: 0, club_id: 0, title: "", body: "", created_at: "", updated_at: "", images: [])
    var body: some View {
        GeometryReader{ geom in
            VStack(alignment:.leading){
                ScrollView{
                    VStack(alignment: .leading, spacing: 10){
                        
                        HStack{
                            Text(post.created_at)
                                .font(Font.custom("Poppins-Regular", size: 10))
                                .opacity(0.5)
                            Spacer()
                        }
                        Text(post.title)
                            .font(Font.custom("Poppins-SemiBold", size: 24))
                        WebImage(url: URL(string: post.images.isEmpty ? DefaultMock.thumbinalImage :  "https://sdulife.abmco.kz/\(post.images[0].path)"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: geom.size.width-30, height: 331, alignment: .center)
                            .clipShape(Rectangle())
                            
                        
                        Text(post.body)
                            .font(Font.custom("Poppins-Regular", size: 15))
                            .opacity(0.8)
                        
//                        Divider()
//
//                        HStack{
//                            Label("Like", systemImage: isLiked ? "heart.fill" : "heart")
//                                .onTapGesture {
//                                    isLiked.toggle()
//                                }
//                            Label("Comment", systemImage: "bubble.left")
//                            Spacer()
//                            Image(systemName: "square.and.arrow.up")
//                        }
//                        .opacity(0.7)
                        Spacer()
                    }
                }
                .padding(.init(top: 0, leading: 17, bottom: 0, trailing: 17))
                .navigationBarTitle("Post", displayMode: .inline)
            }
        }
    }
}

struct ClubPostDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        ClubPostDetailedView()
    }
}
