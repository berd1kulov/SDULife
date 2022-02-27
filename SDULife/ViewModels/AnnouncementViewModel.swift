//
//  AppointmentsViewModel.swift
//  SDULife
//
//  Created by Dias Berdikul on 01.02.2022.
//

import Foundation
import SwiftUI
import Alamofire

final class AnnouncementViewModel: ObservableObject {
    
    @Published var searchedAnnouncements: [Announcement] = []
    @Published var announcements: [Announcement] = [Announcement(id: 0, user_id: 0, title: "Add announcement", description: "", likes: 0, status: 0, created_at: "", updated_at: "", images: [])]
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isLoaded = false
    @Published var isClosed = false
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
    
    func addAnnouncementToServer(imageDatas: [UIImage], user_id: String, title: String, description: String){
        self.isLoading = true
        self.isLoaded = false
        let headers: HTTPHeaders = [
            .authorization("Bearer "+token!),
            .accept("application/json")
        ]
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(user_id.data(using: .utf8)!, withName :"user_id")
            multipartFormData.append(title.data(using: .utf8)!, withName :"title")
            multipartFormData.append(description.data(using: .utf8)!, withName :"description")
            
            for imageData in imageDatas {
                if(imageData.size.width != 0 && imageData.size.height != 0){
                    multipartFormData.append(imageData.jpegData(compressionQuality: 0.5)!, withName: "img[]", fileName: "someFile.jpeg", mimeType: "image/jpeg")
                }
            }
            
            
        }, to: "https://sdulife.abmco.kz/api/announcement", method: .post, headers: headers)
            .uploadProgress(closure: { (progress) in
                if(progress.fractionCompleted == 1){
                    self.isLoading = false
                }
            })
            .responseDecodable(of: AddAnnouncementResponse.self){ response in
                switch response.result {
                case .success:
                    print("Validation Successful)")
                    self.isLoaded = true
                case .failure(let error):
                    print(error)
                }
            }
    }
}
