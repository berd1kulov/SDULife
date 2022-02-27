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
    var body: some View {
        ZStack{
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
                        
                        
                        RefreshableScrollView(content: {
                            LazyVGrid(columns: gridItemLayout, spacing: 0) {
                                ForEach(viewModel.announcements, id: \.self) {announcements in
                                    if(announcements.title == "Add announcement"){
                                        NavigationLink(destination: {
                                            AddAnnouncementView()
                                        }, label: {
                                            AddAnnouncementCell(size: geom.size)
                                        })
                                    }else{
                                        NavigationLink(destination: {
                                            AnnouncementDetailView(announcement: announcements)
                                        }, label: {
                                            AnnouncementCell(announcement: announcements, size: geom.size)
                                        })
                                    }
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
                        }, onRefresh: { control in
                            viewModel.totalPage = 1
                            viewModel.currentPage = 1
                            viewModel.lastPageNotLoaded = true
                            viewModel.announcements.removeAll()
                            viewModel.announcements.append(Announcement(id: 0, user_id: 0, title: "Add announcement", description: "", likes: 0, status: 0, created_at: "", updated_at: "", images: []))
                            viewModel.searchedAnnouncements.removeAll()
                            viewModel.getAnnouncements()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                control.endRefreshing()
                            }
                        })
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
                .onAppear {
                    viewModel.getAnnouncements()
                }
                
            }
            if (viewModel.isLoading && viewModel.announcements.count==1) {
                LoadingView()
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
