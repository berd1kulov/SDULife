//
//  Notification.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import Foundation

struct Notification: Decodable, Hashable{
    var title: String
    var description: String
    var day: String
    var startTime: String
    var endTime: String
}
