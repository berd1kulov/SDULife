//
//  AnnouncementDetailView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct AnnouncementDetailView: View {
    @State private var isLiked: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var announcement: Announcement = Announcement(id: 001, title: "KERMEZ", image: "", club: MockData.sampleClub, date: "25/10/2020")
    var body: some View {
        GeometryReader{ geom in
            NavigationView{
            VStack(alignment:.leading){
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 10){
                        
                        HStack{
                            Text(announcement.date)
                                .font(.system(size: 10))
                                .opacity(0.5)
                            Spacer()
                        }
                        Text(announcement.title)
                            .font(.system(size: 24))
                            .bold()
                        Image(announcement.image.count==0 ? "no-image" : announcement.image )
                            .resizable()
                            .scaledToFit()
                            .frame(width: geom.size.width-30, alignment: .center)
                        
                        Text("Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news. Some information. All about this news.")
                            .font(.system(size: 15))
                            .opacity(0.8)
                        
                        Divider()
                        
                        HStack{
                            Label("Like", systemImage: isLiked ? "heart.fill" : "heart")
                                .onTapGesture {
                                    isLiked.toggle()
                                }
                            Label("Comment", systemImage: "bubble.left")
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                        }
                        .opacity(0.7)
                        Spacer()
                    }
                }
                .padding(.init(top: 0, leading: 17, bottom: 0, trailing: 17))
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                }))
                .navigationBarTitle("Announcement", displayMode: .inline)
            }
            }
        }
        
    }
}

struct AnnouncementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementDetailView(announcement: Announcement(id: 001, title: "KERMEZ", image: "", club: MockData.sampleClub, date: "25/10/2020"))
    }
}
