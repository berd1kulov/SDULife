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
        
        TabView {
            NewsView()
                .tabItem({
                    Image("news")
                        .renderingMode(.template)
                })
            
            ClubsView()
                .tabItem({
                    Image("home")
                        .renderingMode(.template)
                })
            
            DevelopmentView()
                .tabItem({
                    Image("barchart")
                        .renderingMode(.template)
                })
            
            NotificationView()
                .tabItem({
                    Image("notifications")
                        .renderingMode(.template)
                })
            
            ProfileView(isUserLoggedIn: $fullScreenCover)
                .tabItem({
                    Image("user")
                        .renderingMode(.template)
                })
        }
        .accentColor(Color.brandPrimary)
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SDULifeTabView(fullScreenCover: .constant(true))
    }
}
