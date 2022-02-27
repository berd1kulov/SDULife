//
//  NotificationCell.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI
import Foundation

struct NotificationCell: View {
    
    
    @StateObject var viewModel = NotificationViewModel()
    var color: Color = Color.brandPrimary
    var notification: Notification = Notification(id: 0, title: "Hackathon", body: "Some hackathon", created_at: "17:00", updated_at: "17:00")
    var currentTime = "24/02/2022 10:05"
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
                    .font(Font.custom("Poppins-SemiBold", size: 13))
                Spacer()
                HStack{
                    Text(notification.body)
                    Text("\(notification.created_at)")
                }
                .font(Font.custom("Poppins-Regular", size: 13))
                Spacer()
                Text(viewModel.timeInterval)
                    .font(Font.custom("Poppins-Regular", size: 8))
            }
            Spacer()
        }.frame(height: 80, alignment: .leading)
            .onAppear{
                viewModel.dateInterval(startDate: notification.created_at, endDate: currentTime)
            }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
