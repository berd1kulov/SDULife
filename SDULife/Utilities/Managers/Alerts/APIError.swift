//
//  APIError.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 30.11.2021.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}
