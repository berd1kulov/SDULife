//
//  ScheduleSessionPage.swift
//  SDULife
//
//  Created by Dias Berdikul on 29.01.2022.
//

import SwiftUI

struct ScheduleSessionPage: View {
    @State private var selectedDayIndex = 0
    @State private var selectedYearIndex = 0
    @State private var selectedMonthIndex = 0
    
    @State private var startHours = 00
    @State private var startMinutes = 00
    @State private var endHours = 00
    @State private var endMinutes = 00
    @State var name: String = ""
    @State var surname: String = ""
    private var days = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    private var years = ["2022", "2023", "2024", "2025"]
    private var months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    var body: some View {
        VStack{
            TextField(" Name", text: $name)
                .frame(width: 325, height: 50)
                .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
            TextField(" Surname", text: $surname)
                .frame(width: 325, height: 50)
                .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
            HStack{
                Picker("", selection: $selectedDayIndex){
                    ForEach(0..<days.count){
                        Text(self.days[$0])
                            .frame(width: 155, height: 50)
                            .border(Color.gray, width: 1)
                    }
                }
                .frame(width: 155, height: 50)
                .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                Spacer()
                
                Picker("", selection: $selectedYearIndex){
                    ForEach(0..<years.count){
                        Text(self.years[$0])
                            
                    }
                }
                .frame(width: 155, height: 50)
                .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
            }
            HStack{
                Picker("", selection: $selectedMonthIndex){
                    ForEach(0..<months.count){
                        Text(self.months[$0])
                            
                    }
                }
                .frame(width: 155, height: 50)
                .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                Spacer()
            }
            HStack{
                Picker("", selection: $startHours){
                    ForEach(0..<24, id: \.self) { i in
                        Text("\(i)").tag(i)
                    }
                }
                .frame(width: 73, height: 50)
                .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                
                Picker("", selection: $startMinutes){
                    ForEach(0..<60, id: \.self) { i in
                        Text("\(i)").tag(i)
                    }
                }
                .frame(width: 73, height: 50)
                .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                Text("-")
                Picker("", selection: $endHours){
                    ForEach(0..<24, id: \.self) { i in
                        Text("\(i)").tag(i)
                    }
                }
                .frame(width: 73, height: 50)
                .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                
                Picker("", selection: $endMinutes){
                    ForEach(0..<60, id: \.self) { i in
                        Text("\(i)").tag(i)
                    }
                }
                .frame(width: 73, height: 50)
                .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
            }
            Spacer()
            Button(action: {}, label: {
                Text("Add now")
                    .frame(width: 325, height: 50, alignment: .center)
                    .background(Color.brandPrimary)
                    .foregroundColor(.white)
                    .font(Font.custom("Poppins-Regular", size: 12))
            })
        }
        .frame(width: 330)
        .navigationBarTitle("Scedule a session", displayMode: .inline)
    }
}

struct ScheduleSessionPage_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleSessionPage()
    }
}
