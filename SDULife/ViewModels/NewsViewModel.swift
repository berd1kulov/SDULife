//
//  NewsViewModel.swift
//  SDULife
//
//  Created by Dias Berdikul on 01.02.2022.
//

import Foundation
import SwiftUI

final class NewsViewModel: ObservableObject {
    
    @Published var searchedNews: [News] = []
    @Published var news: [News] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedNews: News?
    @Published var searchedText: String = ""
    
    var lastPageNotLoaded = true
    var currentPage = 1
    var totalPage = 1
    let token = UserDefaults.standard.string(forKey: "token")
    
    
    func getNews() {
        isLoading = true
        NetworkManager.shared.getNewsFromServer(token: "Bearer " + (token ?? ""), newsUrl: "https://sdulife.abmco.kz/api/news?page=\(self.currentPage)") { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let newsResponse):
                    self.totalPage = Int(newsResponse.meta.total/newsResponse.meta.per_page)
                    if(self.lastPageNotLoaded){
                        self.news.append(contentsOf: newsResponse.data)
                    }
                    if(self.currentPage >= self.totalPage){
                        self.lastPageNotLoaded = false
                    }
                    
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
    func searchNews(){
        NetworkManager.shared.searchNews(token: "Bearer " + (token ?? ""), text: searchedText){ [self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let searchedNews):
                    self.searchedNews.removeAll()
                    self.searchedNews.append(contentsOf: searchedNews)
                  
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
            
        }
    }
}
