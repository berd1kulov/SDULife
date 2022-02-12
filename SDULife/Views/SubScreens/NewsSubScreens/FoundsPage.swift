//
//  FoundsPage.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

struct FoundsPage: View {
    
    @State private var isEditing = false
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var showingSheet = false
    @StateObject var viewModel = FoundsViewModel()
    @State private var founds: Founds = Founds(id: 001, user_id: 001,title: "Some title", description: "Some description", status: 0, created_at: "22:22", updated_at: "22:22", time: "10:23", images: [])
    @State var searchText: String = ""
    var body: some View {
        ZStack{
        GeometryReader{ geom in
                VStack{
                    if #available(iOS 15.0, *) {
                        SearchBar(text: $viewModel.searchedText)
                            .onSubmit {
                                viewModel.searchFounds()
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
                                ForEach(viewModel.founds) {found in
                                    NavigationLink(destination: {
                                        FoundsDetailView(founds: found)
                                    }, label: {
                                        FoundsCell(found: found, size: geom.size)
                                    })
                                }
                                if(viewModel.currentPage < viewModel.totalPage){
                                    ProgressView()
                                        .padding()
                                        .onAppear{
                                            viewModel.currentPage = viewModel.currentPage + 1
                                            viewModel.getFounds()
                                        }
                                }
                            }
                            .onAppear {
                                viewModel.getFounds()
                            }
                        }
                    }else{
                        ScrollView {
                            LazyVGrid(columns: gridItemLayout, spacing: 0) {
                                ForEach(viewModel.searchedFounds) {found in
                                    NavigationLink(destination: {
                                        FoundsDetailView(founds: found)
                                    }, label: {
                                        FoundsCell(found: found, size: geom.size)
                                    })
                                }
                            }
                        }
                    }
                }
            }
            if (viewModel.isLoading && viewModel.founds.isEmpty) {
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


struct FoundsPage_Previews: PreviewProvider {
    static var previews: some View {
        FoundsPage()
    }
}
