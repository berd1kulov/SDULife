//
//  NewsView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

struct NewsView: View {
    
    @State private var selected = 1
    @State private var isLabelShown = true
    var body: some View {
        VStack{
            if isLabelShown {
                HStack(spacing: 40) {
                    Text("News")
                        .font(Font.custom("Poppins-SemiBold", size: 13))
                        .foregroundColor(selected == 1 ? Color.brandPrimary : .gray)
                    
                    Text("Announcement")
                        .font(Font.custom("Poppins-SemiBold", size: 13))
                        .foregroundColor(selected == 2 ? Color.brandPrimary : .gray)
                    
                    Text("Founds")
                        .font(Font.custom("Poppins-SemiBold", size: 13))
                        .foregroundColor(selected == 3 ? Color.brandPrimary : .gray)
                }
            }
            TabView(selection: self.$selected){
                NewsPage()
                    .tag(1)
                AnnouncementPage()
                    .tag(2)
                FoundsPage()
                    .tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
        }

    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
