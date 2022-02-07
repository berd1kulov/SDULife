//
//  Recommendation.swift
//  SDULife
//
//  Created by Dias Berdikul on 04.02.2022.
//

import Foundation


struct Recommendation: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let description: String
    let image_id: Int?
    let created_at: String
    let updated_at: String
    let videos: [RecommendationVideo]
    let image: [RecommendationImage]
}

struct RecommendationImage: Codable, Hashable {
    let path: String
}

struct RecommendationVideo: Codable, Hashable{
    let url: String
    let title: String
}
