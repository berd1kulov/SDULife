//
//  AppoinmentView.swift
//  SDULife
//
//  Created by Dias Berdikul on 28.01.2022.
//

import SwiftUI

struct AppoinmentView: View {
    
    @StateObject var viewModel = AppointmentViewModel()
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                ForEach(viewModel.appointments){ appointment in
                    NavigationLink(destination: {
                        ScheduleSessionView(appointment: appointment)
                    }, label: {
                        AppointmentCell(appointment: appointment)
                    })
                        
                }
            }
            .onAppear{
                viewModel.getAppointments()
            }
        }.navigationBarTitle("Appointment", displayMode: .inline)
    }
}

struct AppoinmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppoinmentView()
    }
}
