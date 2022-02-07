//
//  AppointmentViewModel.swift
//  SDULife
//
//  Created by Dias Berdikul on 04.02.2022.
//

import Foundation
import SwiftUI

final class AppointmentViewModel: ObservableObject {
    
    @Published var appointments: [Appointment] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    
    let token = UserDefaults.standard.string(forKey: "token")
    
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
}
