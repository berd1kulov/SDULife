//
//  FoundsPage.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

struct FoundsPage: View {
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var showingSheet = false
    @StateObject var viewModel = FoundsViewModel()
    @State private var founds: Founds = Founds(id: 001, user_id: 001,title: "Some title", description: "Some description", status: 0, created_at: "22:22", updated_at: "22:22", time: "10:23", images: ["https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png"])
    @State var searchText: String = ""
    var body: some View {
        GeometryReader{ geom in
            
            VStack{
                SearchBar(text: $searchText)
                    .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 0) {
                        ForEach(viewModel.founds) {found in
                            FoundsCell(found: found, size: geom.size)
                                .onTapGesture {
                                    founds = found
                                    showingSheet = true
                                }
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
                }
            }
            .onAppear {
                viewModel.getFounds()
            }
        }
        .fullScreenCover(isPresented: $showingSheet){
            FoundsDetailView(founds: founds)
        }
    }
}


struct FoundsPage_Previews: PreviewProvider {
    static var previews: some View {
        FoundsPage()
    }
}
