//
//  AnnouncementPage.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

struct AnnouncementPage: View {
    
    @State private var isEditing = false
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    @State var showingSheet = false
    @StateObject var viewModel = AnnouncementViewModel()
    @State var searchText: String = ""
    @State var announcement: Announcement = Announcement(id: 001, user_id: 001,title: "Some title", description: "Some description", likes: 0, status: 0, created_at: "22:22", updated_at: "22:22", images:  [ "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png"])
    var body: some View {
        GeometryReader{ geom in
            VStack{
                if #available(iOS 15.0, *) {
                    SearchBar(text: $viewModel.searchedText)
                        .onSubmit {
                            viewModel.searchAnnouncement()
                        }
                        .submitLabel(.search)

                        .padding(.init(top: 10, leading: 15, bottom: 0, trailing: 15))
                } else {
                    SearchBar(text: $viewModel.searchedText)
                        .padding(.init(top: 10, leading: 15, bottom: 0, trailing: 15))
                }
                if(viewModel.searchedText.isEmpty){
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 0) {
                        ForEach(viewModel.announcements, id: \.self) {announcements in
                            NavigationLink(destination: {
                                AnnouncementDetailView(announcement: announcements)
                            }, label: {
                                AnnouncementCell(announcement: announcements, size: geom.size)
                            })
                        }
                        if(viewModel.currentPage < viewModel.totalPage){
                            ProgressView()
                                .padding()
                                .onAppear{
                                    viewModel.currentPage = viewModel.currentPage + 1
                                    viewModel.getAnnouncements()
                                }
                        }
                    }
                    .onAppear {
                        viewModel.getAnnouncements()
                    }
                    
                }
                }else{
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout, spacing: 0) {
                            ForEach(viewModel.searchedAnnouncements, id: \.self) {announcements in
                                NavigationLink(destination: {
                                    AnnouncementDetailView(announcement: announcements)
                                }, label: {
                                    AnnouncementCell(announcement: announcements, size: geom.size)
                                })
                            }
                        }
                    }
                }
            }
            
        }
        .navigationBarHidden(true)
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AnnouncementPage_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementPage()
    }
}
