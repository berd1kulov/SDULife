//
//  RecommendationViewModel.swift
//  SDULife
//
//  Created by Dias Berdikul on 04.02.2022.
//

import Foundation
import SwiftUI

final class RecommendationViewModel: ObservableObject {
    
    @Published var recommendations: [Recommendation] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedRecommendation: Recommendation?
    
    let token = UserDefaults.standard.string(forKey: "token")
    
    func getRecommendations() {
        isLoading = true
        NetworkManager.shared.getRecommendationsFromServer(token: "Bearer " + (token ?? ""), recommendationUrl: "https://sdulife.abmco.kz/api/recommendation") { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let recommendationResponse):
                    
                    self.recommendations.removeAll()
                    self.recommendations.append(contentsOf: recommendationResponse)
                    self.selectedRecommendation = recommendationResponse[0]
                    
                    
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
