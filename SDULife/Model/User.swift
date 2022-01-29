//
//  User.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import Foundation

struct User:Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let surname: String
    let image: String
    let speciality: String
    let birthday: String
    let phone: String
    let email: String
}


struct MockUserData{
    
    static let sampleUser = User(id: 001, name: "AAA", surname: "BBB", image: "no-image", speciality: "IS", birthday: "10.01.2000", phone: "87777777777", email: "baha@mail.ru")
    
    static let users = [sampleUser, sampleUser,sampleUser,sampleUser,sampleUser]
}
