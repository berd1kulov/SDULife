//
//  User.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import Foundation
import SwiftUI

struct User: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let email: String
    let imageId: String?
    let speciality: String
    let fcmToken: String?
    let birthdate: String
//    let followedClubs: [Club]
//    let joinedClubs: [Club]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case imageId = "image_id"
        case speciality
        case fcmToken = "fcm_token"
        case birthdate
//        case followedClubs = "followed_clubs"
//        case joinedClubs = "joined_clubs"
      }
}

struct UserResponse: Decodable, Hashable {
    let data: User
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct RequestedUser: Decodable, Identifiable, Equatable{
    let id: Int
    let name: String
    let email: String
}

struct UserTranscriptResponse: Decodable, Hashable {
    let data: [UserTranscript]
}

struct UserTranscript: Decodable, Hashable {
    let description: String
    let date: String
    let year: Int
}

struct MockUserData{
    
    static let sampleUser = User(id: 001, name: "AAA", email: "BBB", imageId: "no-image", speciality: "IS", fcmToken: "", birthdate: "10.01.2000")
    
    static let users = [sampleUser, sampleUser,sampleUser,sampleUser,sampleUser]
}
