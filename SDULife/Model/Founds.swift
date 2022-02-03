//
//  Founds.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 19.11.2021.
//

import Foundation

struct Founds: Decodable, Identifiable, Hashable {
    
    var id: Int
    var user_id: Int
    var title: String
    var description: String
    var status: Int
    var created_at: String
    var updated_at: String
    var time: String
    var images: [Images]
}


struct Images: Codable, Hashable{
    let path: String
    let pivot: Pivot
}

struct Pivot:Codable, Hashable{
    let found_id: Int
    let image_id: Int
}

struct FoundsResponse: Decodable, Hashable {
    let data: [Founds]
    let meta: FoundsMeta
}

struct FoundsMeta: Decodable, Hashable {
    var current_page: Int
    var per_page: Int
    var total: Int
}
