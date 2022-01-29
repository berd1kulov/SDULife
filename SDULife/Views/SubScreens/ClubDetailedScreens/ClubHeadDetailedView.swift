//
//  ClubHeadDetailedView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI
struct ClubHeadDetailedView: View {
    var club: Club = MockData.sampleClub
    var body: some View {
        ScrollView{
            VStack{
                WebImage(url: URL(string: club.images.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  (MockData.imageBase + club.images[0].path)))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 54, height: 54, alignment: .center)
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 27)
                            .stroke(Color(red: 69/255, green: 7/255, blue: 73/255), lineWidth: 2)
                    )
                    .padding()
                
                Text(club.name)
                    .bold()
                    .font(.system(size: 17))
                Text(club.chat)
                    .font(.system(size: 13))
                    .opacity(0.7)
                    .padding(.init(top: 0, leading: 0, bottom: 15, trailing: 0))
                HStack{
                    Text("Head: ")
                        .font(.system(size: 13))
                    Text("")
                        .font(.system(size: 13))
                        .bold()
                }.opacity(0.7)
                    
                HStack{
                    Text("Chat: ")
                        .font(.system(size: 13))
                    Text("t.me/visionclubsdu")
                        .font(.system(size: 13))
                        .bold()
                }.opacity(0.7)
                
                Divider()
                HStack(spacing: 57){
                    VStack{
                        Text("438")
                            .bold()
                            .font(.system(size: 17))
                        Text("Posts")
                            .font(.system(size: 13))
                            .opacity(0.7)
                    }
                    VStack{
                        Text("12")
                            .bold()
                            .font(.system(size: 17))
                        Text("Members")
                            .font(.system(size: 13))
                            .opacity(0.7)
                    }
                    VStack{
                        Text("438")
                            .bold()
                            .font(.system(size: 17))
                        Text("Followers")
                            .font(.system(size: 13))
                            .opacity(0.7)
                    }
                }
                Divider()
                
                NavigationLink(destination: {
                    
                }, label: {
                    Text("Follow Request")
                        .frame(width: 310, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 69/255, green: 7/255, blue: 73/255))
                })
                .padding()
                               
                ForEach(0...10, id: \.self){_ in
                    ClubNewsCell()
                    Divider()
                        
                }
                    
            }
            .padding()
            
        }.navigationBarTitle("\(club.name)", displayMode: .inline)
    }
}

struct ClubHeadDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        ClubHeadDetailedView()
    }
}
