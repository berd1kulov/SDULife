//
//  AnnouncementCell.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct AnnouncementCell: View {
    
    var announcement: Announcement
    var size: CGSize
    var body: some View {
        VStack(alignment: .leading){
            Text(announcement.title)
                .font(.system(size: 11))
                .textCase(.uppercase)
                .foregroundColor(Color(red: 69/255, green: 7/255, blue: 73/255))
                .padding()
            Text(announcement.description)
                .bold()
                .font(.system(size: 15))
                .textCase(.uppercase)
                .padding(.init(top: 0, leading: 15, bottom: 15, trailing: 15))
            Spacer()
            Text(announcement.created_at)
                .font(.system(size: 11))
                .opacity(0.5)
                .padding()
        }
        .frame(width: size.width/2+4, height: size.width/2, alignment: .leading)
        .border(Color.gray, width: 0.5)
        .background(Color.gray.opacity(0.1))
        .contentShape(Rectangle())
    }
}

struct AddAnnouncementCell: View {
    var size: CGSize
    var body: some View {
        VStack{
            Image(systemName: "plus.circle")
                .resizable()
                .frame(width: 31, height: 31)
                .font(Font.custom("Poppins-Regular", size: 11))
            Text("Add announcement")
                .font(Font.custom("Poppins-Regular", size: 11))
        }
        
        .frame(width: size.width/2+4, height: size.width/2)
        .border(Color.gray, width: 0.5)
        .foregroundColor(Color.brandPrimary)
        .background(Color.gray.opacity(0.1))
        .contentShape(Rectangle())
    }
}
//
//struct AnnouncementCell_Previews: PreviewProvider {
//    static var previews: some View {
//        AnnouncementCell(announcement: Announcement(id: 001, title: "KERMEZ", image: "", club: MockData.sampleClub, date: "25/10/2020"), size: CGSize(width: 188.5, height: 187.5))
//            .previewLayout(.sizeThatFits)
//    }
//        
//}
