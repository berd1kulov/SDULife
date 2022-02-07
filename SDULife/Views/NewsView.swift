//
//  NewsView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

struct NewsView: View {
    
    @State private var selected = 0
    @State private var isLabelShown = true
    var body: some View {
        NavigationView{
            VStack{
                if isLabelShown {
                    TabBarView(currentTab: $selected)
                }
                TabView(selection: self.$selected){
                    NewsPage()
                        .tag(0)
                    AnnouncementPage()
                        .tag(1)
                    FoundsPage()
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
            }
        }
        
    }
}

struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["News", "Announcement", "Founds"]
    var body: some View {
        
            HStack(spacing: 20) {
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        id: \.0,
                        content: {
                    index, name in
                    TabBarItem(currentTab: self.$currentTab,
                               namespace: namespace.self,
                               tabBarItemName: name,
                               tab: index)
                    
                })
            }
            .padding(.horizontal)
        .frame(height: 40)
//        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                if currentTab == tab {
                    Text(tabBarItemName)
                        .font(Font.custom("Poppins-SemiBold", size: 13))
                        .foregroundColor(Color.brandPrimary)
                    Color.brandPrimary
                        .frame(height: 5)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                } else {
                    Text(tabBarItemName)
                        .font(Font.custom("Poppins-SemiBold", size: 13))
                        .foregroundColor(.gray)
                    Color.clear.frame(height: 5)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
