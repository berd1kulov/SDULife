//
//  Appointment.swift
//  SDULife
//
//  Created by Dias Berdikul on 04.02.2022.
//

import Foundation

struct Appointment: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let subtitle: String
    let description: String
    let image_id: Int?
    let user_id: Int
    let created_at: String
    let updated_at: String
    let image: String?
}

struct AddAppointment: Codable {
    let user_id: Int
    let appointment_id: Int
    let name: String
    let date: String
    let description: String
}

struct AppointmentResponse: Codable {
    let data: [Appointment]
}
