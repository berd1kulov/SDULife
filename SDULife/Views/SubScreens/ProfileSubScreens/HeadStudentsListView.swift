//
//  HeadStudentsListView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct HeadStudentsListView: View {
    
    var users: [User] = [MockUserData.sampleUser]
    var body: some View {
        List(users){ user in
            NavigationLink(destination: {
                StudentProfileView(user: user)
            }, label: {
//                UserListCell(user: user)
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
