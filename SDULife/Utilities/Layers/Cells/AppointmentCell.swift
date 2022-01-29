//
//  AppointmentCell.swift
//  SDULife
//
//  Created by Dias Berdikul on 28.01.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct AppointmentCell: View {
    var body: some View {
        HStack{
            VStack{
                HStack{
                    Text("Men")
                        .font(Font.custom("Poppins-Regular", size: 13))
                        .foregroundColor(.brandPrimary)
                    Spacer()
                }.padding()
                HStack{
                    Text("Al-KHALIF Mukhtaruly")
                        .font(Font.custom("Poppins-SemiBold", size: 13))
                        .foregroundColor(.brandPrimary)
                    Spacer()
                }.padding()
                
                HStack{
                    Text("PhD")
                        .font(Font.custom("Poppins-Light", size: 13))
                        .opacity(0.5)
                    
                    Spacer()
                }.padding()
                
                
            }.frame(width: 162.5)
            WebImage(url: URL(string: "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png"))
                .resizable()
                .frame(width: 162.5, height: 200, alignment: .center)
                .scaledToFill()
        }
        .border(Color.gray, width: 1)
        .cornerRadius(2)
    }
}

struct AppointmentCell_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentCell()
    }
}
