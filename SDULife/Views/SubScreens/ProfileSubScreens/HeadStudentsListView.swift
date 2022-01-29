//
//  HeadStudentsListView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct HeadStudentsListView: View {
    
    var users: [User] = [User(id: 0001, name: "Bakdaulet", surname: "Berdikul", image: "userImage", speciality: "Computer Science", birthday: "10.01.2000", phone: "+7 777 777 77 77", email: "berdikul.bakdaulet@mail.ru"), User(id: 0002, name: "Bakdaulet", surname: "Berdikul", image: "userImage", speciality: "Computer Science", birthday: "10.01.2000", phone: "+7 777 777 77 77", email: "berdikul.bakdaulet@mail.ru"), User(id: 0003, name: "Bakdaulet", surname: "Berdikul", image: "userImage", speciality: "Computer Science", birthday: "10.01.2000", phone: "+7 777 777 77 77", email: "berdikul.bakdaulet@mail.ru")]
    var body: some View {
        List(users){ user in
            NavigationLink(destination: {
                StudentProfileView(user: user)
            }, label: {
                UserListCell(user: user)
            })
            
        }
        .listStyle(.plain)
        .navigationBarTitle("List of my students", displayMode: .inline)
    }
}

struct HeadStudentsListView_Previews: PreviewProvider {
    static var previews: some View {
        HeadStudentsListView()
    }
}
