//
//  UserViewModel.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 21.02.2022.
//

import Foundation
import SwiftUI
import Alamofire

final class UserViewModel: ObservableObject {
    
    @Published var user: User = User(id: 0, name: "", email: "", imageId: "", speciality: "", fcmToken: "", birthdate: "")
    @Published var userTranscript: [UserTranscript] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isFileLoaded = false
    @Published var filePath: String = ""
    
    var lastPageNotLoaded = true
    var currentPage = 1
    var totalPage = 1
    let token = UserDefaults.standard.string(forKey: "token")
    let userID: Int = Int(UserDefaults.standard.string(forKey: "userID")!)!
    
    func getUserTranscript() {
        isLoading = true
        NetworkManager.shared.getUserTranscriptFromServer(token: "Bearer " + (token ?? ""), userTranscriptUrl: "https://sdulife.abmco.kz/api/user/\(userID)/transcript") { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let userResponse):
                    userTranscript.removeAll()
                    userTranscript.append(contentsOf: userResponse.data)
                    
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
    
    func getUserInfoFromServer(){
        self.isLoading = true
            let headers: HTTPHeaders = [
                .authorization("Bearer "+token!),
                .accept("application/json")
            ]
        AF.request("https://sdulife.abmco.kz/api/user", method: .get, headers: headers)
           
            .responseDecodable(of: UserResponse.self){ response in
                switch response.result {
                case .success:
                    guard let userData = response.value else { return }
                    self.user = userData.data
                case .failure(let error):
                    print(error)
                }
            }
        }
    
    func downdloadTFromServer(){
        self.isLoading = true
        
//        NetworkManager.shared.downloadPDF(token: "Bearer " + (token ?? "")){ error in
//            if(error == nil){
//                debugPrint("PDF Downloaded successfully!")
//            }else{
//                debugPrint(String(describing: error?.localizedDescription))
//            }
//        }
        let destination: DownloadRequest.Destination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("transcript.pdf")

            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        let headers: HTTPHeaders = [
                .authorization("Bearer "+token!),
                .accept("application/json")
            ]

        AF.download("https://sdulife.abmco.kz/api/user/\(userID)/transcript/file", headers: headers, to: destination)
            .response { response in
                //debugPrint(response)
                self.isLoading = false
                if response.error == nil, let filePath = response.fileURL?.path {
                    print(filePath)
                    self.filePath = filePath
                    self.isFileLoaded = true
                }
            }
    }
    
    
    
}
