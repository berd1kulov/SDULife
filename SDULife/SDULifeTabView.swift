//
//  ContentView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI
import CoreData

struct SDULifeTabView: View {

    @Binding var fullScreenCover: Bool
    var body: some View {
        GeometryReader{ geom in
        TabView {
            ClubsView()
                .tabItem({
                    Image("home")
                        .renderingMode(.template)
                })
            
            NewsView()
                .tabItem({
                    Image("news")
                        .renderingMode(.template)
                })
            
            DevelopmentView(size: geom.size)
                .tabItem({
                    Image("barchart")
                        .renderingMode(.template)
                })
            
            NotificationView()
                .tabItem({
                    Image("notifications")
                        .renderingMode(.template)
                })
            
            ProfileView(isUserLoggedIn: $fullScreenCover, user: User(id: 0001, name: "Bakdaulet", surname: "Berdikul", image: "userImage", speciality: "Computer Science", birthday: "10.01.2000", phone: "+7 777 777 77 77", email: "berdikul.bakdaulet@mail.ru"))
                .tabItem({
                    Image("user")
                        .renderingMode(.template)
                })
        }
        .accentColor(Color.brandPrimary)
        }
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SDULifeTabView(fullScreenCover: .constant(true))
    }
}
