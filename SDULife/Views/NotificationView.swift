//
//  NotificationView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    Text("Today")
                        .font(.system(size: 13))
                        .opacity(0.5)
                    NotificationCell()
                    
                    Text("Earlier")
                        .font(.system(size: 13))
                        .opacity(0.5)
                        .padding(.init(top: 15, leading: 0, bottom: 0, trailing: 0))
                    NotificationCell(color: Color.gray)
                    Divider()
                    NotificationCell(color: Color.gray)
                    Divider()
                }
                .padding()
            }
            .navigationBarTitle("Notification", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(action: {}, label: {
                    Image("calendar")
                })
            )
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
