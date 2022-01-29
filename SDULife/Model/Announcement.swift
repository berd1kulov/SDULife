//
//  Announcement.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import Foundation


struct Announcement:Decodable, Identifiable, Hashable{
    var id: Int
    var title: String
    var image: String
    var club: Club
    var date: String
}
