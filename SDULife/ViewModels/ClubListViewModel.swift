//
//  ClubListViewModel.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 30.11.2021.
//

import Foundation
import SwiftUI

final class ClubListViewModel: ObservableObject {
    
    @Published var clubs: [Club] = []
    @Published var joined_clubs: [Club] = []
    @Published var followed_clubs: [Club] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedClub: Club?
    @Published var joinMessage: String = ""
    @Published var req_type: Int = 1
    @Published var users:[RequestedUser] = []
    
    
    var lastPageNotLoaded = true
    var currentPage = 1
    var totalPage = 1
    let token = UserDefaults.standard.string(forKey: "token")
    let userID = UserDefaults.standard.string(forKey: "userID")
    
    func getClubs() {
        isLoading = true
        NetworkManager.shared.getClubsFromServer(token: "Bearer " + (token ?? ""), clubsUrl: "https://sdulife.abmco.kz/api/club") { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let clubsResponse):
                    self.clubs.removeAll()
                    self.joined_clubs.removeAll()
                    self.followed_clubs.removeAll()
                    self.clubs.append(contentsOf: clubsResponse.clubs)
                    self.joined_clubs.append(contentsOf: clubsResponse.joined_clubs)
                    self.followed_clubs.append(contentsOf: clubsResponse.followd_clubs)
                    
                    
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
    
    func joinLeaveAcceptRequest(){
        NetworkManager.shared.clubJoinLeaveAcceptRequest(req_type: req_type,token: "Bearer " + (token ?? ""), club_id: selectedClub!.id, user_id: Int(userID!)!){ [self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let joinMessage):
                    self.joinMessage = joinMessage
                  
                    
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
    
    func getFollowRequests(){
        NetworkManager.shared.getClubRequests(club_id: selectedClub!.id, token: "Bearer " + (token ?? "")){ [self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self.users = users
                  
                    
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
