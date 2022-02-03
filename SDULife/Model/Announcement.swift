//
//  Announcement.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import Foundation


struct Announcement:Decodable, Identifiable, Hashable{
    var id: Int
    var user_id: Int
    var title: String
    var description: String
    var likes: Int
    var status: Int
    var created_at: String
    var updated_at: String
    var images: [String]
}


struct AnnouncementResponse: Decodable, Hashable {
    let data: [Announcement]
    let meta: AnnouncementMeta
}

struct AnnouncementMeta: Decodable, Hashable {
    var current_page: Int
    var per_page: Int
    var total: Int
}
