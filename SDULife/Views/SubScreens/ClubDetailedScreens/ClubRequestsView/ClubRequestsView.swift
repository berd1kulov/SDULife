//
//  ClubRequestsView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct ClubRequestsView: View {
    
    var club: Club = Club(id: 4, name: "Some name", description: "Some desc", head_id: 2, chat: "", status: 1, created_at: "", updated_at: "", images: [], posts: 100, members: 1, followers: 1, head_name: "", is_followed: false, is_member: false)
    @State var user_requests:[RequestedUser] =  [RequestedUser(id: 4, name: "Bakdaulet", email: "180103056")]
    @State private var isAccepted = false
    @StateObject var viewModel = ClubListViewModel()
    var body: some View {
        VStack{
            Text(viewModel.joinMessage).font(.largeTitle)
            List(viewModel.users){ user in
                HStack{
                    UserListCell(user: user)
                    Spacer()
                    Button(action: {
                        
                        viewModel.req_type = 4
                        viewModel.selectedClub = club
                        viewModel.joinLeaveAcceptRequest()
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .frame(width: 32, height: 32, alignment: .center)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    })
                    Button(action: {
                        viewModel.req_type = 3
                        viewModel.selectedClub = club
                        viewModel.joinLeaveAcceptRequest()
                        isAccepted = true
                    }, label: {
                        Image(systemName: "checkmark")
                            .frame(width: 32, height: 32, alignment: .center)
                            .background(Color(red: 69/255, green: 7/255, blue: 73/255))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    })
                }
                
            }
            .listStyle(.plain)
            .navigationBarTitle("Follow Request", displayMode: .inline)
            .onAppear{
                viewModel.selectedClub = club
                viewModel.getFollowRequests()
                user_requests = viewModel.users
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct ClubRequestsView_Previews: PreviewProvider {
    static var previews: some View {
        ClubRequestsView()
    }
}
