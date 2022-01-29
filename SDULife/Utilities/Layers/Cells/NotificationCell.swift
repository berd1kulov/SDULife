//
//  NotificationCell.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct NotificationCell: View {
    
    var color: Color = Color(red: 69/255, green: 7/255, blue: 73/255)
    var notification: Notification = Notification(title: "Hackathon", description: "Some hackathon", day: "10.01.2021", startTime: "17:00", endTime: "17:00")
    var body: some View {
        HStack{
            VStack{
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10, height: 10, alignment: .center)
                    .foregroundColor(color)
                
                Spacer()
                
            }
            VStack(alignment: .leading){
                Text(notification.title)
                    .bold()
                    .font(.system(size: 13))
                Spacer()
                HStack{
                    Text(notification.day)
                    Text("\(notification.startTime) - \(notification.endTime)")
                }
                .font(.system(size: 13))
                Spacer()
                Text("2 minutes ago")
                    .font(.system(size: 8))
            }
            Spacer()
        }.frame(height: 80, alignment: .leading)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
