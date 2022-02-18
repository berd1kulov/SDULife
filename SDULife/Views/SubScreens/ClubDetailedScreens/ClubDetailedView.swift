//
//  ClubDetailedView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ClubDetailedView: View {
    
    @StateObject var viewModel = ClubListViewModel()
    @State var club: Club = MockData.sampleClub
    let userID = UserDefaults.standard.string(forKey: "userID")
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
                Text(club.description)
                    .font(Font.custom("Poppins-Light", size: 13))
                    .opacity(0.7)
                    .padding(.init(top: 10, leading: 0, bottom: 15, trailing: 0))
                HStack{
                    Text("Head: \(club.head_name)")
                        .font(Font.custom("Poppins-Regular", size: 13))
                    Text("")
                        .font(Font.custom("Poppins-SemiBold", size: 13))
                }.opacity(0.7)
                
                HStack{
                    Text("Chat: ")
                        .font(Font.custom("Poppins-Regular", size: 13))
                    Link("\(club.chat)", destination: URL(string: "\(club.chat)")!)
                        .font(Font.custom("Poppins-SemiBold", size: 13))
//                    Text("\(club.chat)")
//                        .font(Font.custom("Poppins-SemiBold", size: 13))
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
                VStack {
                    Text(viewModel.joinMessage).font(.largeTitle)
                    if(club.head_id != Int(userID ?? "0")){
                        HStack{
                            if(!club.is_member){
                                Button(action: {
                                    viewModel.selectedClub = club
                                    viewModel.req_type = 1
                                    viewModel.joinLeaveAcceptRequest()
                                }, label: {
                                    Text("Join")
                                        .frame(width: 155, height: 50, alignment: .center)
                                        .foregroundColor(.white)
                                        .background(Color(red: 69/255, green: 7/255, blue: 73/255))
                                })
                            }else if(club.is_member){
                                Button(action: {
                                    viewModel.selectedClub = club
                                    viewModel.req_type = 2
                                    viewModel.joinLeaveAcceptRequest()
    
                                }, label: {
                                    Text("Leave")
                                        .frame(width: 155, height: 50, alignment: .center)
                                        .foregroundColor(.white)
                                        .background(Color(red: 69/255, green: 7/255, blue: 73/255))
                                })
                            }
                            if(club.is_followed){
                                Button(action: {}, label: {
                                    Text("Unfollow")
                                        .frame(width: 155, height: 50, alignment: .center)
                                        .foregroundColor(.white)
                                        .background(Color(red: 69/255, green: 7/255, blue: 73/255))
                                })
                            }else{
                                Button(action: {}, label: {
                                    Text("Follow")
                                        .frame(width: 155, height: 50, alignment: .center)
                                        .foregroundColor(.white)
                                        .background(Color(red: 69/255, green: 7/255, blue: 73/255))
                                })
                            }
                        }
                        .padding()
                    }else{
                        NavigationLink(destination: {
                            ClubRequestsView(club: club)
                        }, label: {
                            Text("Follow Request")
                                .frame(width: 310, height: 50, alignment: .center)
                                .foregroundColor(.white)
                                .background(Color(red: 69/255, green: 7/255, blue: 73/255))
                        })
                            .padding()
                    }
                    ForEach(viewModel.clubPosts){post in
                        ClubNewsCell(clubPost: post)
                        Divider()

                    }
                    if(viewModel.currentPage < viewModel.totalPage){
                        ProgressView()
                            .padding()
                            .onAppear{
                                viewModel.currentPage = viewModel.currentPage + 1
                                viewModel.getClubPosts()
                            }
                    }
                }
                
            }
            .onAppear{
                viewModel.selectedClubId = club.id
                viewModel.getClubPosts()
            }
            .padding()
            
        }.navigationBarTitle("\(club.name)", displayMode: .inline)
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
    }
}

struct ClubDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailedView()
    }
}
