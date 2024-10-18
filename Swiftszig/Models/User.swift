//
//  User.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/5/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let username: String
    let joined: TimeInterval
}
