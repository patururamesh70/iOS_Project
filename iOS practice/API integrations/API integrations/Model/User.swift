//
//  User.swift
//  API integrations
//
//  Created by patururamesh on 06/11/24.
//

import Foundation

struct Welcome: Codable {
    let contacts: [Contact]
}

struct Contact: Codable {
    let id, name, email: String
}
