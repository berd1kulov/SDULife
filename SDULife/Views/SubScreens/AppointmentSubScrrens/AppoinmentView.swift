//
//  AppoinmentView.swift
//  SDULife
//
//  Created by Dias Berdikul on 28.01.2022.
//

import SwiftUI

struct AppoinmentView: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                ForEach(0..<5){i in
                    NavigationLink(destination: {
                        ScheduleSessionView()
                    }, label: {
                        AppointmentCell()
                    })
                        
                }
            }
        }.navigationBarTitle("Appointment", displayMode: .inline)
    }
}

struct AppoinmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppoinmentView()
    }
}
