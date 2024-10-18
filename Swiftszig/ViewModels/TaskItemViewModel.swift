//
//  TaskItemViewModel.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/5/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TaskItemViewModel: ObservableObject {
    init() {
        
    }
    
    func toggleIsDone(item: TaskItem) {
        var itemCopy = item
        itemCopy.isDone.toggle()

        guard let uid = Auth.auth().currentUser?.uid else {
          return
        }

        let db = Firestore.firestore()
        db.collection("users")
          .document(uid)
          .collection("tasks")
          .document(itemCopy.id)
          .setData(itemCopy.asDictionary())
    }
}
