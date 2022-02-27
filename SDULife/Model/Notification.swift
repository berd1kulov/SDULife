//
//  Notification.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import Foundation

struct Notification: Decodable, Hashable, Identifiable{
    let id: Int
    let title: String
    let body: String
    let created_at: String
    let updated_at: String
}

struct NotificationResponse: Decodable, Hashable {
    let data: [Notification]
    let meta: NotificationMeta
}

struct NotificationMeta: Decodable, Hashable {
    var current_page: Int
    var per_page: Int
    var total: Int
}
