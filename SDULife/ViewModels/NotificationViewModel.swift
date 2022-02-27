//
//  NotificationViewModel.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 22.02.2022.
//

import Foundation

class NotificationViewModel: ObservableObject {
    
    @Published var notifications: [Notification] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var timeInterval = ""
    var lastPageNotLoaded = true
    var currentPage = 1
    var totalPage = 1
    let token = UserDefaults.standard.string(forKey: "token")
    
    
    func getNotifications() {
        isLoading = true
        NetworkManager.shared.getNotificationsFromServer(token: "Bearer " + (token ?? ""), notificationUrl: "https://sdulife.abmco.kz/api/notifications?page=\(self.currentPage)") { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let decodedResponse):
                    self.totalPage = Int(decodedResponse.meta.total/decodedResponse.meta.per_page)
                    if(self.lastPageNotLoaded){
                        self.notifications.append(contentsOf: decodedResponse.data)
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
    
    func dateInterval(startDate: String, endDate: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        let startDate = formatter.date(from: startDate)
        let endDate = formatter.date(from: endDate)
        let diffSeconds = Int(startDate!.timeIntervalSinceReferenceDate) - Int(endDate!.timeIntervalSinceReferenceDate)
        if((diffSeconds / 86400) != 0 ){
            self.timeInterval =  "\(abs(diffSeconds / 86400)) days ago"
        }else if((diffSeconds / 3600) != 0 ){
            self.timeInterval =  "\(abs(diffSeconds / 3600)) hours ago"
        }else if(((diffSeconds % 3600) / 60) != 0 ){
            self.timeInterval =  "\((abs(diffSeconds % 3600) / 60)) minutes ago"
        }else{
            self.timeInterval = "\(abs(diffSeconds)) seconds ago"
        }
    }
}
