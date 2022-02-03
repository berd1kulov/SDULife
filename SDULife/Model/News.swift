//
//  News.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import Foundation

struct News:Decodable, Identifiable, Hashable {
    var id: Int
    var author: String
    var title: String
    var body: String
    var likes: Int
    var status: Int
    var created_at: String
    var updated_at: String
    var images: [String]
}

struct NewsResponse: Decodable, Hashable {
    let data: [News]
    let meta: NewsMeta
}

struct NewsMeta: Decodable, Hashable {
    var current_page: Int
    var per_page: Int
    var total: Int
}
