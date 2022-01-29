//
//  StudentProfileView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct StudentProfileView: View {
    var user: User = User(id: 0001, name: "Bakdaulet", surname: "Berdikul", image: "userImage", speciality: "Computer Science", birthday: "10.01.2000", phone: "+7 777 777 77 77", email: "berdikul.bakdaulet@mail.ru")
    var body: some View {
        ScrollView{
            VStack{
                Image(user.image)
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(40)
                    .padding()
                
                Text("\(user.name) \(user.surname)")
                    .bold()
                    .font(.system(size: 16))
                Text("\(user.id)")
                    .font(.system(size: 12))
                    .opacity(0.5)
                HStack{
                    Text("Personal Information about Student")
                        .bold()
                        .font(.system(size: 13))
                    Spacer()
                }
                .padding(.init(top: 15, leading: 0, bottom: 15, trailing: 0))
                
                HStack{
                    VStack(alignment:.leading){
                        Text("1-st year")
                            .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                        Text("- Member of  Music Club\n- Member of Shapagat\n- Volounteer on Almaty Marathon\n- Participant on Hackaton")
                    }
                    Spacer()
                }
                Divider()
                HStack{
                    VStack(alignment:.leading){
                        Text("2-nd year")
                            .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                        Text("- Member of  Music Club\n- Member of Shapagat\n- Volounteer on Almaty Marathon\n- Participant on Hackaton")
                    }
                    Spacer()
                }
                
            }
        }
        .padding(30)
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct StudentProfileView_Previews: PreviewProvider {
    static var previews: some View {
        StudentProfileView()
    }
}
