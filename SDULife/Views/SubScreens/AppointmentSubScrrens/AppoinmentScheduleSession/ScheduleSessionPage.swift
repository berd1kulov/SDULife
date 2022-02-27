//
//  ScheduleSessionPage.swift
//  SDULife
//
//  Created by Dias Berdikul on 29.01.2022.
//

import SwiftUI

struct ScheduleSessionPage: View {
    
    @State var checkTerms  = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var appointmentScheduleTimes: [String] = []
    var appointment: Appointment
    @State private var selectedTimeIndex = 0
    @State var name: String = ""
    @State var surname: String = ""
    @State var problem: String = ""
    let screenSize = UIScreen.main.bounds.size
    @StateObject var viewModel = AppointmentViewModel()
    var body: some View {
        VStack{
            TextField("Name", text: $name)
                .frame(width: screenSize.width-100, height: 40)
                .padding(7)
                .padding(.horizontal, 25)

                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(lineWidth: 0.2)
                )
                .padding(.horizontal, 10)
            TextField("Surname", text: $surname)
                .frame(width: screenSize.width-100, height: 40)
                .padding(7)
                .padding(.horizontal, 25)

                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(lineWidth: 0.2)
                )
                .padding(.horizontal, 10)
            TextField("Problem", text: $problem)
                .frame(width: screenSize.width-100, height: 40)
                .padding(7)
                .padding(.horizontal, 25)

                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(lineWidth: 0.2)
                )
                .padding(.horizontal, 10)
            HStack{
                Text("Schedule Times: ")
                Spacer()
                Picker("", selection: $selectedTimeIndex){
                    ForEach(0..<appointmentScheduleTimes.count){
                        Text(self.appointmentScheduleTimes[$0])
                    }
                }
                .frame(width: (screenSize.width-100)/2, height: 40)
                .padding(7)
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(lineWidth: 0.2)
                )
            }
            .padding(.horizontal, 18)
            Spacer()
            HStack{
                Toggle("I agree with", isOn: $checkTerms)
                    .toggleStyle(CheckboxToggleStyle(style: .square))
                    .foregroundColor(Color.brandPrimary)
                Link(destination: URL(string: "https://drive.google.com/file/d/1FTVE8qlkt2roIbEMjK6-RthGvZgTgzm6/view")!, label: {
                    Text("terms and conditions")
                        .underline()
                })
            }
            .font(Font.custom("Poppins-Regular", size: 12))
            Button(action: {
                viewModel.postAppointmentScheduleToServer(appointment_id: appointment.id, name: "\(name) \(surname)", date: appointmentScheduleTimes[selectedTimeIndex], description: problem)
                name = ""
                surname = ""
                problem = ""
            }, label: {
                Text("Add now")
                    .frame(width: screenSize.width-100, height: 50, alignment: .center)
                    .background((name.isEmpty || surname.isEmpty || problem.isEmpty) ? Color.gray : Color.brandPrimary)
                    .foregroundColor(.white)
                    .font(Font.custom("Poppins-Regular", size: 12))
                    .cornerRadius(2)
            })
                .disabled(name.isEmpty || surname.isEmpty || problem.isEmpty || (checkTerms == false))
        }
        .onChange(of: viewModel.message, perform: { newValue in
            if newValue == "success"{
                presentationMode.wrappedValue.dismiss()
            }
        })
        .navigationBarTitle("Scedule a session", displayMode: .inline)
    }
}

//struct ScheduleSessionPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ScheduleSessionPage(appointmentScheduleTimes: [""])
//    }
//}
