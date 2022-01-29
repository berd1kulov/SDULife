//
//  ClubDetailedView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ClubDetailedView: View {
    
    var club: Club = MockData.sampleClub
    var body: some View {
        ScrollView{
            VStack{
                WebImage(url: URL(string: club.images.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  (MockData.imageBase + club.images[0].path)))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(red: 69/255, green: 7/255, blue: 73/255), lineWidth: 2)
                    )
                    .padding()
                
                Text(club.name)
                    .font(Font.custom("Poppins-SemiBold", size: 17))
                Text(club.chat)
                    .font(Font.custom("Poppins-Light", size: 13))
                    .opacity(0.7)
                    .padding(.init(top: 10, leading: 0, bottom: 15, trailing: 0))
                HStack{
                    Text("Head: \(club.head_id) - \(club.head_name)")
                        .font(Font.custom("Poppins-Regular", size: 13))
                    Text("")
                        .font(Font.custom("Poppins-SemiBold", size: 13))
                }.opacity(0.7)
                    
                HStack{
                    Text("Chat: ")
                        .font(Font.custom("Poppins-Regular", size: 13))
                    Text("\(club.chat)")
                        .font(Font.custom("Poppins-SemiBold", size: 13))
                }.opacity(0.7)
                
                Divider()
                HStack(spacing: 57){
                    VStack{
                        Text("\(club.posts)")
                            .font(Font.custom("Poppins-SemiBold", size: 17))
                        Text("Posts")
                            .font(Font.custom("Poppins-Regular", size: 13))
                            .opacity(0.7)
                    }
                    VStack{
                        Text("\(club.members)")
                            .font(Font.custom("Poppins-SemiBold", size: 17))
                        Text("Members")
                            .font(Font.custom("Poppins-Regular", size: 13))
                            .opacity(0.7)
                    }
                    VStack{
                        Text("\(club.followers)")
                            .font(Font.custom("Poppins-SemiBold", size: 17))
                        Text("Followers")
                            .font(Font.custom("Poppins-Regular", size: 13))
                            .opacity(0.7)
                    }
                }
                Divider()
                
                HStack{
                    Button(action: {}, label: {
                        Text("Join")
                            .frame(width: 155, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(red: 69/255, green: 7/255, blue: 73/255))
                    })
                    Button(action: {}, label: {
                        Text("Follow")
                            .frame(width: 155, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(red: 69/255, green: 7/255, blue: 73/255))
                    })
                }
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

struct ClubDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailedView()
    }
}
