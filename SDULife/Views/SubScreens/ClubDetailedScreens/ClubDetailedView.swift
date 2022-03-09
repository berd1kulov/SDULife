//
//  ClubDetailedView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ClubDetailedView: View {
    
    let screenSize = UIScreen.main.bounds.size
    @State var joinLeaveButtonTitle = ""
    @State var followUnfollowButtonTitle = ""
    @StateObject var viewModel = ClubListViewModel()
    @State var club: Club = MockData.sampleClub
    let userID = UserDefaults.standard.string(forKey: "userID")
    var body: some View {
        ScrollView{
            VStack{
                WebImage(url: URL(string: club.images.isEmpty ? DefaultMock.thumbinalImage :  (MockData.imageBase + club.images[0].path)))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.brandPrimary, lineWidth: 2)
                    )
                    .padding()
                
                Text(club.name)
                    .font(Font.custom("Poppins-SemiBold", size: 17))
                Text(club.description)
                    .font(Font.custom("Poppins-Light", size: 11))
                    .opacity(0.7)
                    .padding(.init(top: 10, leading: 30, bottom: 15, trailing: 30))
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
                }.opacity(0.7)
                
                Divider()
                HStack{
                    VStack{
                        Text("\(club.posts)")
                            .font(Font.custom("Poppins-SemiBold", size: 17))
                        Text("Posts")
                            .font(Font.custom("Poppins-Regular", size: 13))
                            .opacity(0.7)
                    }
                    .frame( width: screenSize.width/3)
        
                    VStack{
                        Text("\(club.members)")
                            .font(Font.custom("Poppins-SemiBold", size: 17))
                        Text("Members")
                            .font(Font.custom("Poppins-Regular", size: 13))
                            .opacity(0.7)
                    }
                    .frame( width: screenSize.width/3)
                    VStack{
                        Text("\(club.followers)")
                            .font(Font.custom("Poppins-SemiBold", size: 17))
                        Text("Followers")
                            .font(Font.custom("Poppins-Regular", size: 13))
                            .opacity(0.7)
                    }
                    .frame( width: screenSize.width/3)
                }
                Divider()
                VStack {
                    if(club.head_id != Int(userID ?? "0")){
                        HStack{
                            Button(action: {
                                if(joinLeaveButtonTitle == "Join"){
                                    viewModel.selectedClub = club
                                    viewModel.req_type = 1
                                    viewModel.joinLeaveAcceptRequest()
                                    joinLeaveButtonTitle = "Leave"
                                }else if(joinLeaveButtonTitle == "Leave"){
                                    viewModel.selectedClub = club
                                    viewModel.req_type = 2
                                    viewModel.joinLeaveAcceptRequest()
                                    joinLeaveButtonTitle = "Join"
                                }
                            }, label: {
                                Text(joinLeaveButtonTitle)
                                    .frame(width: (screenSize.width/2) - 40, height: 50, alignment: .center)
                                    .foregroundColor(.white)
                                    .background(Color.brandPrimary)
                                    .cornerRadius(2)
                            })
                            
                            Button(action: {
                                if(followUnfollowButtonTitle == "Follow"){
                                    viewModel.followUnfollowToClub(followReq: true, club_id: club.id)
                                    followUnfollowButtonTitle = "Unfollow"
                                    club.followers += 1
                                }else if(followUnfollowButtonTitle == "Unfollow"){
                                    viewModel.followUnfollowToClub(followReq: false, club_id: club.id)
                                    followUnfollowButtonTitle = "Follow"
                                    club.followers -= 1
                                }
                                
                            }, label: {
                                Text(followUnfollowButtonTitle)
                                    .frame(width: (screenSize.width/2) - 40, height: 50, alignment: .center)
                                    .foregroundColor(.white)
                                    .background(Color.brandPrimary)
                                    .cornerRadius(2)
                            })
                        }
                        .padding()
                    }else{
                        NavigationLink(destination: {
                            ClubRequestsView(club: club)
                        }, label: {
                            Text("Follow Request")
                                .frame(width: (screenSize.width) - 70, height: 50, alignment: .center)
                                .foregroundColor(.white)
                                .background(Color.brandPrimary)
                                .cornerRadius(2)
                        })
                            .padding()
                    }
                    ForEach(viewModel.clubPosts){post in
                        NavigationLink(destination: {
                            ClubPostDetailedView(post: post)
                        }, label: {
                            ClubNewsCell(clubPost: post)
                                .padding(.init(top: 0, leading: 25, bottom: 0, trailing: 25))
                        })
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
                if(club.is_followed){followUnfollowButtonTitle = "Unfollow"}
                else{followUnfollowButtonTitle = "Follow"}
                
                if(club.is_reqeuseted){joinLeaveButtonTitle = "Leave"}
                else if(club.is_member){joinLeaveButtonTitle = "Joined"}
                else{joinLeaveButtonTitle = "Join"}
                
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
