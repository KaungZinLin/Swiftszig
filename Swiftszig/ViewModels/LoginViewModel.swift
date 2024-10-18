//
//  LoginViewModel.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/5/24.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var error: String = ""
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error {
                self.error = error.localizedDescription
            } else {

            }
        }
    }
    
    private func validate() -> Bool {
        error = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            error = "All fields are required. Please complete them before proceeding."
            return false
        }
        
        guard email.contains("@"), email.contains(".") else {
            error = "Please enter a valid email address."
            return false
        }
        
        return true
    }
}
