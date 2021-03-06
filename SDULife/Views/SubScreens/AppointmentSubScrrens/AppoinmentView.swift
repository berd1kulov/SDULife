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
        ZStack{
            ScrollView(showsIndicators: false){
                VStack{
                    ForEach(viewModel.appointments){ appointment in
                        NavigationLink(destination: {
                            ScheduleSessionView(appointment: appointment)
                        }, label: {
                            AppointmentCell(appointment: appointment)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                
                        })
                        
                    }
                }
                .onAppear{
                    viewModel.getAppointments()
                }
            }
            if (viewModel.isLoading && viewModel.appointments.isEmpty) {
                LoadingView()
            }
        }
        .navigationBarTitle("Appointment", displayMode: .inline)
        .background(Color.white)
    }
}

struct AppoinmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppoinmentView()
    }
}
