//
//  AppointmentViewModel.swift
//  SDULife
//
//  Created by Dias Berdikul on 04.02.2022.
//

import Foundation
import SwiftUI
import Alamofire

class AppointmentViewModel: ObservableObject {
    
    @Published var message: String = ""
    @Published var appointmentSchedule: [String] = []
    @Published var appointments: [Appointment] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    
    let token = UserDefaults.standard.string(forKey: "token")
    let userID: Int = Int(UserDefaults.standard.string(forKey: "userID")!)!
    
    func getAppointments() {
        isLoading = true
        NetworkManager.shared.getAppointmentsFromServer(token: "Bearer " + (token ?? ""), appointmentUrl: "https://sdulife.abmco.kz/api/appointment") { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let appointmentResponse):
                    self.appointments.removeAll()
                    self.appointments.append(contentsOf: appointmentResponse)
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
    
    func getAppointmentScheduleFromServer(userId: Int){
        self.isLoading = true
            let headers: HTTPHeaders = [
                .authorization("Bearer "+token!),
                .accept("application/json")
            ]
        AF.request("https://sdulife.abmco.kz/api/appointment/\(userId)", method: .get, headers: headers)
           
            .responseDecodable(of: AppointmentSchedule.self){ response in
                switch response.result {
                case .success:
                    guard let responseData = response.value else { return }
                    self.appointmentSchedule.append(contentsOf: responseData.schedule)
                case .failure(let error):
                    print(error)
                }
            }
        }
    
    func postAppointmentScheduleToServer(appointment_id: Int, name: String, date: String, description: String){
        self.isLoading = true
            let headers: HTTPHeaders = [
                .authorization("Bearer "+token!),
                .accept("application/json")
            ]
        
        let parameters: [String: Any] = [
            "user_id" : self.userID,
            "appointment_id": appointment_id,
            "name": name,
            "date": date,
            "description": description
        ]
        AF.request("https://sdulife.abmco.kz/api/appointment/create",
                   method: .post,
                   parameters: parameters,
                   headers: headers)
            .responseDecodable(of: AddAppointmentMessage.self){ response in
                switch response.result {
                case .success:
                    guard let responseData = response.value else { return }
                    self.message = responseData.message
                case .failure(let error):
                    print(error)
                }
            }
        }
}

struct AddAppointmentMessage: Decodable {
    let message: String
}
