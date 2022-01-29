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
    var body: some View {
        VStack{
            HStack{
                WebImage(url: URL(string: "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png"))
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
                    .cornerRadius(17.5)
                    .scaledToFill()
                VStack(alignment: .leading){
                    Text("Saltanat Amangeldiyeva")
                        .font(Font.custom("Poppins-SemiBold", size: 12))
                    Text("PhD Psychology")
                        .font(Font.custom("Poppins-Regular", size: 12))
                        .opacity(0.5)
                }
                Spacer()
            }
            Divider()
            ScrollView{
                VStack{
                    Text("")
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
