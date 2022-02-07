//
//  ScheduleSessionView.swift
//  SDULife
//
//  Created by Dias Berdikul on 28.01.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ScheduleSessionView: View {
    
    @State var text: String = ""
    var appointment: Appointment = Appointment(id: 1, name: "", type: "", subtitle: "", description: "", image_id: 1, user_id: 1, created_at: "", updated_at: "", image: "")
    var body: some View {
        VStack{
            HStack{
                WebImage(url: URL(string:appointment.image == nil ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" : (MockData.imageBase + appointment.image!)))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .cornerRadius(17.5)
                VStack(alignment: .leading){
                    Text(appointment.name)
                        .font(Font.custom("Poppins-SemiBold", size: 12))
                    Text(appointment.subtitle)
                        .font(Font.custom("Poppins-Regular", size: 12))
                        .opacity(0.5)
                }
                Spacer()
            }
            Divider()
            ScrollView{
                VStack{
                    Link("Link to Chat", destination: URL(string: "https://t.me/berd1kulov")!)
                }
            }
            
            Spacer()
            NavigationLink(destination: {
                ScheduleSessionPage()
            }, label: {
                Text("Schedule a session")
                    .frame(width: 325, height: 50, alignment: .center)
                    .background(Color.brandPrimary)
                    .foregroundColor(.white)
                    .font(Font.custom("Poppins-Regular", size: 12))
            })
        }.padding()
            
    }
}

struct ScheduleSessionView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleSessionView()
    }
}
