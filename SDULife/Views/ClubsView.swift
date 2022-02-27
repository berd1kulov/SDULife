//
//  ClubsView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI
import SwiftUIRefresh

struct ClubsView: View {
    
    @State var searchText: String = ""
    @StateObject var viewModel = ClubListViewModel()
    @State private var isShowing = false
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    if #available(iOS 15.0, *) {
                        SearchBar(text: $viewModel.searchedText)
                            .onSubmit {
                                viewModel.searchClub()
                            }
                            .submitLabel(.search)
                        
                            .padding(.init(top: 14, leading: 15, bottom: 0, trailing: 15))
                    } else {
                        SearchBar(text: $viewModel.searchedText)
                            .padding(.init(top: 14, leading: 15, bottom: 0, trailing: 15))
                    }
                    if(viewModel.searchedText.isEmpty){
                        List{
                            HStack{
                                Text("Univercity Clubs")
                                    .font(Font.custom("Poppins-Regular", size: 13))
                                Spacer()
                            }.padding(.init(top: 15, leading: 0, bottom: 0, trailing: 0))
                            ForEach(viewModel.clubs){ club in
                                NavigationLink(destination: {
                                    ClubDetailedView(club: club)
                                }, label: {
                                    ClubsCell(club: club)
                                        .foregroundColor(Color.brandPrimary)
                                })
                                    .padding()
                            }
                            
                            HStack{
                                Text("Joined Clubs")
                                    .font(Font.custom("Poppins-Regular", size: 13))
                                Spacer()
                            }.padding(.init(top: 15, leading: 0, bottom: 0, trailing: 0))
                            ForEach(viewModel.joined_clubs){ club in
                                NavigationLink(destination: {
                                    ClubDetailedView(club: club)
                                }, label: {
                                    ClubsCell(club: club)
                                        .foregroundColor(Color.brandPrimary)
                                })
                                    .padding()
                            }
                            
                            HStack{
                                Text("Followed Clubs")
                                    .font(Font.custom("Poppins-Regular", size: 13))
                                Spacer()
                            }.padding(.init(top: 15, leading: 0, bottom: 0, trailing: 0))
                            ForEach(viewModel.followed_clubs){ club in
                                NavigationLink(destination: {
                                    ClubDetailedView(club: club)
                                }, label: {
                                    ClubsCell(club: club)
                                        .foregroundColor(Color.brandPrimary)
                                })
                                    .padding()
                            }
                            
                        }.listStyle(.plain)
                            .pullToRefresh(isShowing: $isShowing) {
                                viewModel.getClubs()
                                isShowing = false
                            }
                    }else{
                        List{
                            HStack{
                                Text("Searched Clubs")
                                    .font(Font.custom("Poppins-Regular", size: 13))
                                Spacer()
                            }.padding(.init(top: 15, leading: 0, bottom: 0, trailing: 0))
                            ForEach(viewModel.searchedClubs){ club in
                                NavigationLink(destination: {
                                    ClubDetailedView(club: club)
                                }, label: {
                                    ClubsCell(club: club)
                                        .foregroundColor(Color.brandPrimary)
                                })
                                    .padding()
                            }
                        }.listStyle(.plain)
                    }
                }
                .navigationBarTitle("University Clubs", displayMode: .inline)
            }
            .onAppear {
                viewModel.getClubs()
                viewModel.loadFCM()
            }
            if (viewModel.isLoading && viewModel.clubs.isEmpty) {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
        }
    }
}

struct ClubsView_Previews: PreviewProvider {
    static var previews: some View {
        ClubsView()
    }
}
