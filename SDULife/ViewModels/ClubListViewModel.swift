//
//  ClubListViewModel.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 30.11.2021.
//

import Foundation
import SwiftUI
import Alamofire

final class ClubListViewModel: ObservableObject {
    
    @Published var searchedText: String = ""
    @Published var clubPosts: [ClubNews] = []
    @Published var clubs: [Club] = []
    @Published var searchedClubs: [Club] = []
    @Published var joined_clubs: [Club] = []
    @Published var followed_clubs: [Club] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedClub: Club?
    @Published var selectedClubId: Int = 0
    @Published var joinMessage: String = ""
    @Published var req_type: Int = 1
    @Published var users:[RequestedUser] = []
    @Published var selected_user_id: Int = 0
    
    
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
        NetworkManager.shared.clubJoinLeaveAcceptRequest(req_type: req_type,token: "Bearer " + (token ?? ""), club_id: selectedClub!.id, user_id: Int(userID!)!, accDeclineUserId: selected_user_id){ [self] result in
            
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
    
    func getClubPosts() {
        isLoading = true
        NetworkManager.shared.getClubPostsFromServer(token: "Bearer " + (token ?? ""), clubPostUrl: "https://sdulife.abmco.kz/api/club/posts/\(self.selectedClubId)?page=\(self.currentPage)") { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let clubPostsResponse):
                    self.totalPage = Int(clubPostsResponse.meta.total/clubPostsResponse.meta.per_page)
                    if(self.lastPageNotLoaded){
                        self.clubPosts.append(contentsOf: clubPostsResponse.data)
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
    
    func loadFCM(){
        let token = UserDefaults.standard.string(forKey: "token")
        let fcmToken = UserDefaults.standard.string(forKey: "fcmToken")
        print("LOADTOKEN: \(token ?? "")")
        print("LOADTOKEN: \(fcmToken ?? "")")
        let parameters: [String: Any] = [
            "token" : fcmToken ?? ""
        ]
        let headers: HTTPHeaders = [
            .authorization("Bearer " + (token ?? "")),
            .accept("application/json")
        ]
        AF.request("https://sdulife.abmco.kz/api/savetoken",
                   method: .post,
                   parameters: parameters,
                   headers: headers)
            .responseDecodable(of: FcmTokenResponse.self){ response in
                switch response.result {
                case .success:
                    guard let responseData = response.value else { return }
                    print("FCMRESPONSE: \(responseData.success)")
                case .failure(let error):
                    print("ERROR: \(error)")
                }
            }
    }
    
    func searchClub(){
        NetworkManager.shared.searchClubsFromServer(token: "Bearer " + (token ?? ""), text: searchedText){ [self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let searchedClubs):
                    self.searchedClubs.removeAll()
                    self.searchedClubs.append(contentsOf: searchedClubs)
                  
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
    
    func followUnfollowToClub(followReq: Bool, club_id: Int){
        let token = UserDefaults.standard.string(forKey: "token")
        let followParameters: [String: Any] = [
            "club_id" : club_id,
            "user_id" : userID ?? ""
        ]
        let unfollowParameters: [String: Any] = [
            "club_id" : club_id
        ]
        let headers: HTTPHeaders = [
            .authorization("Bearer " + (token ?? "")),
            .accept("application/json")
        ]
        AF.request(followReq ? "https://sdulife.abmco.kz/api/club/follow" : "https://sdulife.abmco.kz/api/club/unfollow",
                   method: .post,
                   parameters: followReq ? followParameters : unfollowParameters,
                   headers: headers)
            .responseDecodable(of: FollowUnfollowResponse.self){ response in
                switch response.result {
                case .success:
                    guard let responseData = response.value else { return }
                    print("FOLLOWRESPONSE: \(responseData.message)")
                case .failure(let error):
                    print("ERROR: \(error)")
                }
            }
    }
}
struct FollowUnfollowResponse: Decodable {
    let message: String
}
