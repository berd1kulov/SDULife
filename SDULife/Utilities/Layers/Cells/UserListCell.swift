//
//  UserRequestCell.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct UserListCell: View {
    
    var user: RequestedUser = RequestedUser(id: 002, name: "Bakdaulet", email: "180103056")
    var body: some View {
        HStack{
            Image("no-image")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            VStack(alignment: .leading){
                Text("\(user.name) \(user.email)")
                    .font(.system(size: 15))
                Text("\(user.id)")
                    .font(.system(size: 11))
                    .opacity(0.5)
            }
        }
    }
}

struct UserRequestCell_Previews: PreviewProvider {
    static var previews: some View {
        UserListCell()
    }
}
