//
//  Club.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import Foundation

struct Club: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var description: String
    var head_id: Int
    var chat: String
    var status: Int
    var created_at: String
    var updated_at: String
    var images: [ClubImage]
    var posts: Int
    var members: Int
    var followers: Int
    var head_name: String
    var is_followed: Bool
    var is_member: Bool
}

struct ClubImage: Codable, Hashable {
    var path: String
}

struct ClubNews: Codable, Identifiable, Hashable {
    let id: Int
    let club_id: Int
    let title: String
    let body: String
    let created_at: String
    let updated_at: String
    let images: [ClubImage]
}

struct ClubResponse: Decodable, Hashable {
    let clubs: [Club]
    let joined_clubs: [Club]
    let followd_clubs: [Club]
}

struct ClubNewsResponse: Decodable, Hashable {
    let data: [ClubNews]
    let meta: ClubNewsMeta
}

struct ClubNewsMeta: Decodable, Hashable {
    var current_page: Int
    var per_page: Int
    var total: Int
}



struct MockData{
    static let sampleClub = Club(id: 001, name: "Vision Club",description: "Some desc.", head_id: 1, chat: "Ladies club",status: 1,created_at: "",updated_at: "", images: [], posts: 1, members: 12, followers: 230, head_name: "Alama", is_followed: false, is_member: false)
    
    static let imageBase = "https://sdulife.abmco.kz"
    
    static let clubs = [sampleClub, sampleClub, sampleClub, sampleClub, sampleClub, sampleClub]
}
