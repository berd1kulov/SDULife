//
//  ClubRequestsView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI


struct ClubRequestsView: View {
    
    var club: Club = Club(id: 4, name: "Some name", description: "Some desc", head_id: 2, chat: "", status: 1, created_at: "", updated_at: "", images: [], posts: 100, members: 1, followers: 1, head_name: "", is_followed: false, is_member: false, is_reqeuseted: false)
    @State var user_requests:[RequestedUser] =  [RequestedUser(id: 4, name: "Bakdaulet", email: "180103056")]
    @State private var isAccepted = false
    @StateObject var viewModel = ClubListViewModel()
    var body: some View {
        VStack{
            List{
                ForEach(viewModel.users) { user in
                    if #available(iOS 15.0, *) {
                        HStack{
                            UserListCell(user: user)
                            Spacer()
                            Text("<-  swipe")
                                .font(Font.custom("Poppins-Light", size: 10))
                        }
                        .swipeActions(allowsFullSwipe: false) {
                            Button {
                                viewModel.selected_user_id = user.id
                                viewModel.req_type = 4
                                viewModel.selectedClub = club
                                viewModel.joinLeaveAcceptRequest()
                                isAccepted = true
                                viewModel.users.remove(at:viewModel.users.firstIndex(of: user)!)
                            } label: {
                                Label("Delete", systemImage: "xmark")
                            }
                            .tint(.red)
                            
                            Button(role: .destructive) {
                                viewModel.selected_user_id = user.id
                                viewModel.req_type = 3
                                viewModel.selectedClub = club
                                viewModel.joinLeaveAcceptRequest()
                                isAccepted = true
                                viewModel.users.remove(at:viewModel.users.firstIndex(of: user)!)
                            } label: {
                                Label("Accept", systemImage: "checkmark")
                            }
                            .tint(.indigo)
                        }
                        
                    } else {
                        HStack{
                            UserListCell(user: user)
                            
                            Spacer()
                            Text("<-  swipe")
                                .font(Font.custom("Poppins-Light", size: 10))
                            
                            
                            Button(action: {
                                viewModel.selected_user_id = user.id
                                viewModel.req_type = 4
                                viewModel.selectedClub = club
                                viewModel.joinLeaveAcceptRequest()
                                viewModel.users.remove(at:viewModel.users.firstIndex(of: user)!)
                                isAccepted = true
                            }, label: {
                                Image(systemName: "xmark")
                                    .frame(width: 32, height: 32, alignment: .center)
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(16)
                            })
                            Spacer()
                            Button(action: {
                                viewModel.selected_user_id = user.id
                                viewModel.req_type = 3
                                viewModel.selectedClub = club
                                viewModel.joinLeaveAcceptRequest()
                                viewModel.users.remove(at:viewModel.users.firstIndex(of: user)!)
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
                }
                
            }
            .toast(message: viewModel.joinMessage,
                         isShowing: $isAccepted,
                         duration: Toast.short)
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
