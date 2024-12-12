//
//  Message.swift
//  WeatherAPi
//
//  Created by patururamesh on 09/09/24.
//
import Foundation

struct Message: Codable {
    let id: String
    let senderId: String
    let receiverId: String
    let text: String
    let timestamp: Date
}
