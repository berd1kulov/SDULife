//
//  AppointmentsViewModel.swift
//  SDULife
//
//  Created by Dias Berdikul on 01.02.2022.
//

import Foundation
import SwiftUI

final class AnnouncementViewModel: ObservableObject {
    
    @Published var searchedAnnouncements: [Announcement] = []
    @Published var announcements: [Announcement] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAnnouncement: Announcement?
    @Published var searchedText: String = ""
    
    var lastPageNotLoaded = true
    var currentPage = 1
    var totalPage = 1
    let token = UserDefaults.standard.string(forKey: "token")
    
    
    func getAnnouncements() {
        isLoading = true
        NetworkManager.shared.getAnnouncementFromServer(token: "Bearer " + (token ?? ""), announcementUrl: "https://sdulife.abmco.kz/api/announcement?page=\(self.currentPage)") { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let announcementResponse):
                    self.totalPage = Int(announcementResponse.meta.total/announcementResponse.meta.per_page)
                    if(self.lastPageNotLoaded){
                        self.announcements.append(contentsOf: announcementResponse.data)
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
    
    func searchAnnouncement(){
        NetworkManager.shared.searchAnnouncements(token: "Bearer " + (token ?? ""), text: searchedText){ [self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let searchedAnnouncement):
                    self.searchedAnnouncements.removeAll()
                    self.searchedAnnouncements.append(contentsOf: searchedAnnouncement)
                  
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
