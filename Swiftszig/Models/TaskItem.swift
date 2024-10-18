//
//  File.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/10/24.
//

import Foundation

struct TaskItem: Codable, Identifiable {
    let id: String
    let taskName: String
    var isMainTask: Bool
    let taskPripority: String
    let startDateAndTime: TimeInterval
    let endDate: TimeInterval
    let createdDate: TimeInterval
    let iconName: String
    let taskColor: String
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}

