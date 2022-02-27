//
//  NetworkManager.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 30.11.2021.
//

import UIKit
import Alamofire
import SwiftUI

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://sdulife.abmco.kz/api/"
    private let clubURL = baseURL + "club/requests/"
    
    private init() {}
    
    
    func getClubRequests(club_id: Int, token: String, completed: @escaping (Result<[RequestedUser], APIError>) -> Void) {
        guard let url = URL(string: "\(clubURL)\(club_id)") else {
            completed(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([RequestedUser].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }

    func getClubsFromServer(token: String, clubsUrl: String, completed: @escaping (Result<ClubResponse, APIError>) -> Void) {
        guard let url = URL(string: clubsUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ClubResponse.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getRecommendationsFromServer(token: String, recommendationUrl: String, completed: @escaping (Result<[Recommendation], APIError>) -> Void) {
        guard let url = URL(string: recommendationUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([Recommendation].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getAppointmentsFromServer(token: String, appointmentUrl: String, completed: @escaping (Result<[Appointment], APIError>) -> Void) {
        guard let url = URL(string: appointmentUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppointmentResponse.self, from: data)
                completed(.success(decodedResponse.data))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getFoundsFromServer(token: String, foundsUrl: String, completed: @escaping (Result<FoundsResponse, APIError>) -> Void) {
        guard let url = URL(string: foundsUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(FoundsResponse.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getAnnouncementFromServer(token: String, announcementUrl: String, completed: @escaping (Result<AnnouncementResponse, APIError>) -> Void) {
        guard let url = URL(string: announcementUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AnnouncementResponse.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getNewsFromServer(token: String, newsUrl: String, completed: @escaping (Result<NewsResponse, APIError>) -> Void) {
        guard let url = URL(string: newsUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(NewsResponse.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    
    func login(email: String,  password: String, completion: @escaping (Result<LoginResponse, AuthenticationError>) -> Void){
        
        guard let url = URL(string: "https://sdulife.abmco.kz/api/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let _ = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(loginResponse))

        }.resume()
    }
    
    
    func clubJoinLeaveAcceptRequest(req_type: Int, token: String, club_id: Int,  user_id: Int, accDeclineUserId: Int, completion: @escaping (Result<String, APIError>) -> Void){
        var basicURL: String = "https://sdulife.abmco.kz/api/club"
        if(req_type == 1){
            basicURL = "\(basicURL)/join"
        }else if(req_type == 2){
            basicURL = "\(basicURL)/leave"
        }else if(req_type == 3){
            basicURL = "\(basicURL)/accept/request"
        }else if(req_type == 4){
            basicURL = "\(basicURL)/decline/request"
        }
        guard let url = URL(string: basicURL) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token, forHTTPHeaderField: "Authorization")
        if(req_type == 1){
            request.httpBody = try? JSONEncoder().encode(ClubJoinRequestBody(club_id: club_id, user_id: user_id))
        }else if(req_type == 2){
            request.httpBody = try? JSONEncoder().encode(ClubLeaveRequestBody(club_id: club_id))
        }else if(req_type == 3 || req_type == 4){
            request.httpBody = try? JSONEncoder().encode(ClubJoinRequestBody(club_id: club_id, user_id: accDeclineUserId))
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let clubJoinResponse = try? JSONDecoder().decode(ClubRequestMessage.self, from: data) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let joinMessage = clubJoinResponse.message else {
                completion(.failure(.invalidData))
                return
            }
            
            completion(.success(joinMessage))

        }.resume()
    }
    
    func getClubPostsFromServer(token: String, clubPostUrl: String, completed: @escaping (Result<ClubNewsResponse, APIError>) -> Void) {
        guard let url = URL(string: clubPostUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ClubNewsResponse.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func searchNews(token: String, text: String, completion: @escaping (Result<[News], APIError>) -> Void){
        let basicURL: String = "https://sdulife.abmco.kz/api/search/news"
        guard let url = URL(string: basicURL) else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token, forHTTPHeaderField: "Authorization")
        let parameters: [String: Any] = [
            "text": text
            ]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions())
        }catch{
            print("ERROR: OOPS!")
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            guard let searchResponse = try? JSONDecoder().decode([News].self, from: data) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            completion(.success(searchResponse))

        }.resume()
    }
    
    func searchAnnouncements(token: String, text: String, completion: @escaping (Result<[Announcement], APIError>) -> Void){
        let basicURL: String = "https://sdulife.abmco.kz/api/search/announcement"
        guard let url = URL(string: basicURL) else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let parameters: [String: Any] = [
            "text": text
            ]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions())
        }catch{
            print("ERROR: OOPS!")
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            guard let searchResponse = try? JSONDecoder().decode([Announcement].self, from: data) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            completion(.success(searchResponse))

        }.resume()
    }
    
    func searchFounds(token: String, text: String, completion: @escaping (Result<[Founds], APIError>) -> Void){
        let basicURL: String = "https://sdulife.abmco.kz/api/search/found"
        guard let url = URL(string: basicURL) else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let parameters: [String: Any] = [
            "text": text
            ]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions())
        }catch{
            print("ERROR: OOPS!")
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            guard let searchResponse = try? JSONDecoder().decode([Founds].self, from: data) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            completion(.success(searchResponse))

        }.resume()
    }
    
    func getUserTranscriptFromServer(token: String, userTranscriptUrl: String, completed: @escaping (Result<UserTranscriptResponse, APIError>) -> Void) {
        guard let url = URL(string: userTranscriptUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(UserTranscriptResponse.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getNotificationsFromServer(token: String, notificationUrl: String, completed: @escaping (Result<NotificationResponse, APIError>) -> Void) {
        guard let url = URL(string: notificationUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(NotificationResponse.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func searchClubsFromServer(token: String, text: String, completion: @escaping (Result<[Club], APIError>) -> Void){
        let basicURL: String = "https://sdulife.abmco.kz/api/search/club"
        guard let url = URL(string: basicURL) else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token, forHTTPHeaderField: "Authorization")
        let parameters: [String: Any] = [
            "text": text
            ]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions())
        }catch{
            print("ERROR: OOPS!")
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            guard let searchResponse = try? JSONDecoder().decode([Club].self, from: data) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            completion(.success(searchResponse))

        }.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}


struct LoginRequestBody: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let user: ProfileUser?
    let token: String?
}

struct ProfileUser: Codable, Identifiable {
    var id: Int
    var name: String
}

struct ClubJoinRequestBody: Codable {
    let club_id: Int
    let user_id: Int
}

struct ClubLeaveRequestBody: Codable {
    let club_id: Int
}

struct ClubRequestMessage: Codable {
    let message: String?
}
