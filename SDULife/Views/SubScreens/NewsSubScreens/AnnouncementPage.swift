//
//  AnnouncementPage.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

struct AnnouncementPage: View {
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var showingSheet = false
    var announcementsList: [Announcement] = [Announcement(id: 001, title: "KERMEZ", image: "", club: MockData.sampleClub, date: "25/10/2020"), Announcement(id: 002, title: "KERMEZ", image: "", club: MockData.sampleClub, date: "25/10/2020")]
    @State private var announcement: Announcement = Announcement(id: 001, title: "KERMEZ", image: "", club: MockData.sampleClub, date: "25/10/2020")
    @State var searchText: String = ""
    var body: some View {
        GeometryReader{ geom in
            VStack{
                SearchBar(text: $searchText)
                    .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 0) {
                        ForEach(announcementsList, id: \.self) {announcements in
                            AnnouncementCell(announcement: announcements, size: geom.size)
                                .onTapGesture {
                                    announcement = announcements
                                    showingSheet = true
                                }
                        }
                    }
                }
            }            
        }
        .fullScreenCover(isPresented: $showingSheet){
            AnnouncementDetailView(announcement: announcement)
        }
    }
}

struct AnnouncementPage_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementPage()
    }
}
