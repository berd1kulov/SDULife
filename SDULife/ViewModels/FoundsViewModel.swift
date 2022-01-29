//
//  FoundsViewModel.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 23.12.2021.
//

import Foundation
import SwiftUI

final class FoundsViewModel: ObservableObject {
    
    @Published var founds: [Founds] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedClub: Founds?
    
    var lastPageNotLoaded = true
    var currentPage = 1
    var totalPage = 1
    let token = UserDefaults.standard.string(forKey: "token")
    
    
    func getFounds() {
        isLoading = true
        NetworkManager.shared.getFoundsFromServer(token: "Bearer " + (token ?? ""), foundsUrl: "https://sdulife.abmco.kz/api/found?page=\(self.currentPage)") { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let foundsResponse):
                    self.totalPage = Int(foundsResponse.meta.total/foundsResponse.meta.per_page)
                    if(self.lastPageNotLoaded){
                        self.founds.append(contentsOf: foundsResponse.data)
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
}
