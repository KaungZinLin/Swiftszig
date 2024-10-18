//
//  TaskViewModel.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/5/24.
//

import Foundation
import FirebaseFirestore

class TaskViewModel: ObservableObject {
    @Published var monthName: String = ""
    @Published var year: Int = 0
    @Published var fullDate: String = ""
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        
        let currentMonthAndYear = getCurrentMonthAndYear()
        self.monthName = currentMonthAndYear.month
        self.year = currentMonthAndYear.year
        self.fullDate = getTodayDateInRegionFormat()
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("tasks")
            .document(id)
            .delete()
    }
    
    func getCurrentMonthAndYear() -> (month: String, year: Int) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()

        
        dateFormatter.dateFormat = "MMMM"

        let month = dateFormatter.string(from: currentDate)

        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDate)

        return (month, year)
    }
    func getTodayDateInRegionFormat() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = .current
        
        dateFormatter.dateFormat = "MMMM d, yyyy"  // Example: "October 10, 2024"
        
        return dateFormatter.string(from: currentDate)
    }
}
