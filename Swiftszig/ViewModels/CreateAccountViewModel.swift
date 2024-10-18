//
//  CreateAccountViewModel.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/5/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CreateAccountViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var error: String = ""
    
    init() {
        
    }
    
    func create() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, username: username, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        error = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            error = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            error = "Please enter a valid email address."
            return false
        }
        
        guard password.count >= 8 else {
            error = "Password must contain at least 8 characters."
            return false
        }
        
        return true
    }
}
