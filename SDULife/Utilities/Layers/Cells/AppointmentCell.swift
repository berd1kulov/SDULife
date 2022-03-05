//
//  AppointmentCell.swift
//  SDULife
//
//  Created by Dias Berdikul on 28.01.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct AppointmentCell: View {
    
    var appointment: Appointment = Appointment(id: 1, name: "", type: "", subtitle: "", description: "", image_id: 1, user_id: 1, created_at: "", updated_at: "", image: "no-image")
    let screenSize = UIScreen.main.bounds.size
    var body: some View {
        HStack{
            VStack{
                HStack{
                    Text(appointment.type)
                        .font(Font.custom("Poppins-Regular", size: 13))
                        .foregroundColor(.brandPrimary)
                    Spacer()
                }.padding()
                HStack{
                    Text(appointment.name)
                        .font(Font.custom("Poppins-SemiBold", size: 13))
                        .foregroundColor(.brandPrimary)
                    Spacer()
                }.padding()
                
                HStack{
                    Text(appointment.subtitle)
                        .font(Font.custom("Poppins-Light", size: 13))
                        .lineLimit(nil)
                        .opacity(0.5)
                    Spacer()
                }.padding(.init(top: 0, leading: 10, bottom: 10, trailing: 10))
                
            }.frame(width: (screenSize.width/2)-26)
            WebImage(url: URL(string: appointment.image == nil ? DefaultMock.thumbinalImage : (MockData.imageBase + appointment.image!)))
                .resizable()
                .scaledToFill()
                .frame(width: (screenSize.width/2)-26, height: screenSize.height/4)
                .clipShape(Rectangle())
        }
        .background(Color.white)
        .frame(height: screenSize.height/4)
        .clipShape(RoundedRectangle(cornerRadius: 2))
        .overlay(
            RoundedRectangle(cornerRadius: 2)
                .stroke(lineWidth: 0.01)
               
        )
        .padding(.init(top: 0, leading: 26, bottom: 0, trailing: 26))
    }
}

struct AppointmentCell_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentCell()
    }
}
