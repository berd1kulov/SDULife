//
//  News.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import Foundation

struct News:Decodable, Identifiable, Hashable {
    var id: Int
    var title: String
    var image: String
    var date: String
}
