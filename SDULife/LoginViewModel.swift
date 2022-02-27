//
//  LoginViewModel.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 22.12.2021.
//

import Foundation
import Alamofire

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = (UserDefaults.standard.string(forKey: "token") != nil)
    @Published var error: String?
    @Published var isLoading = false
    
    func login(){
        let defaults = UserDefaults.standard
        isLoading = true
        NetworkManager.shared.login(email: email.lowercased(), password: password) { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let loginResponse):
                    defaults.setValue(loginResponse.token, forKey: "token")
                    defaults.setValue(loginResponse.user?.id, forKey: "userID")
                    print("TOKEN: \(String(describing: loginResponse.token))")
                    print("USER: \(String(describing: loginResponse.user?.id))")
                    self.isAuthenticated = true
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    switch error{
                    case .invalidCredentials:
                        self.error = "ID or Password incorrect"
                    case .custom(errorMessage: let errorMessage):
                        self.error = errorMessage
                    }
                }
            }
        }
    }
}
