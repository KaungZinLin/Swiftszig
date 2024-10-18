//
//  AddTaskViewModel.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/1/24.
//
import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddTaskViewModel: ObservableObject {
    @Published var taskName: String = ""
    @Published var task: String = ""
    @Published var mainTask: String = ""
    @Published var taskPriority: String = ""
    @Published var iconName: String = "list.bullet"
    @Published var isMainTask: Bool = false
    @Published var startDateAndTime = Date()
    @Published var endTime = Date()
    @Published var isShowingAlert = false
    @Published var colorSelection: [String] = ["Blue", "Green", "Mint", "Orange", "Purple", "Indigo", "Cyan", "Red"]
    @Published var selectedColor: String = "Blue"
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newItem = TaskItem(id: newId,
                               taskName: taskName,
                               isMainTask: isMainTask,
                               taskPripority: taskPriority,
                               startDateAndTime: startDateAndTime.timeIntervalSince1970,
                               endDate: endTime.timeIntervalSince1970,
                               createdDate: Date().timeIntervalSince1970,
                               iconName: iconName,
                               taskColor: selectedColor,
                               isDone: false)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("tasks")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !taskName.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard startDateAndTime >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        guard endTime > startDateAndTime, endTime >= Date() else {
            return false
        }
        
        if let priorityInt = Int(taskPriority) {
            guard priorityInt > 10 || priorityInt < 0 else {
                return true
            }
            
            return false
        }
        
        return true
    }
}
