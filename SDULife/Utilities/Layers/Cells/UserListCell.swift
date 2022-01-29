//
//  UserRequestCell.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct UserListCell: View {
    
    var user: User = User(id: 002, name: "Bakdaulet", surname: "Beridkul", image: "userImage", speciality: "IS", birthday: "10/01/2000", phone: "+77777777777", email: "bakdaulet@mail.ru")
    var body: some View {
        HStack{
            Image(user.image)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            VStack(alignment: .leading){
                Text("\(user.name) \(user.surname)")
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
