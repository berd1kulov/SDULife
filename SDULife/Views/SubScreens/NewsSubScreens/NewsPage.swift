//
//  NewsPage.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

struct NewsPage: View {
    
    @State private var isEditing = false
    @State var searchText: String = ""
    @State private var showingSheet = false
    @StateObject var viewModel = NewsViewModel()
    var newsList: [News] = [News(id: 0001, author: "Some author", title: "Nauryz fest", body: "Some text", likes: 0, status: 1, created_at: "11/11/2011", updated_at: "11/11/2011", images: ["hackathon"]), News(id: 0002, author: "Some author", title: "Nauryz fest", body: "Some text", likes: 0, status: 1, created_at: "11/11/2011", updated_at: "11/11/2011", images: ["hackathon"])]
    
    var body: some View {
        VStack{
            if #available(iOS 15.0, *) {
                SearchBar(text: $viewModel.searchedText)
                    .onSubmit {
                        viewModel.searchNews()
                    }
                    .submitLabel(.search)

                    .padding(.init(top: 10, leading: 15, bottom: 0, trailing: 15))
            } else {
                SearchBar(text: $viewModel.searchedText)
                    .padding(.init(top: 10, leading: 15, bottom: 0, trailing: 15))
            }
            if(viewModel.searchedText.isEmpty){
            ScrollView{
                ForEach(viewModel.news){ news in
                    NavigationLink(destination: {
                        NewsDetailView(news: news)
                        
                    }, label: {
                        NewsCell(news: news)
                    })
                }
                if(viewModel.currentPage < viewModel.totalPage){
                    ProgressView()
                        .padding()
                        .onAppear{
                            viewModel.currentPage = viewModel.currentPage + 1
                            viewModel.getNews()
                        }
                }
            }
            .onAppear {
                viewModel.getNews()
            }
            }else{
                ScrollView{
                    ForEach(viewModel.searchedNews){ news in
                        NavigationLink(destination: {
                            NewsDetailView(news: news)
                        }, label: {
                            NewsCell(news: news)
                        })
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

struct NewsPage_Previews: PreviewProvider {
    static var previews: some View {
        NewsPage()
    }
}
