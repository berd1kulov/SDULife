//
//  NewsPage.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

struct NewsPage: View {
    
    @State var searchText: String = ""
    @State private var showingSheet = false
 
    var newsList: [News] = [News(id: 0001, title: "Nauryz fest", image: "hackathon", date: "22/10/2020"), News(id: 0002, title: "Hackathon for freshmans", image: "hackathon", date: "22/02/2020")]
    @State private var newss: News = News(id: 0001, title: "Nauryz fest", image: "hackathon", date: "22/10/2020")
    
    var body: some View {
//        NavigationView{
            VStack{
                SearchBar(text: $searchText)
                    .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
                List(newsList){ news in
                    NewsCell(news: news)
                        .onTapGesture {
                            newss = news
                            showingSheet.toggle()
                        }
                }
                .listStyle(.plain)
            }
            .fullScreenCover(isPresented: $showingSheet){
                NewsDetailView(news: newss)
            }
    }
}

struct NewsPage_Previews: PreviewProvider {
    static var previews: some View {
        NewsPage()
    }
}
