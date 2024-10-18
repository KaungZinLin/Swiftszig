//
//  AccountViewModel.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/5/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AccountViewModel: ObservableObject {
    @Published var user: User? = nil
    private var db = Firestore.firestore()
    @Published var alertMessage: String = ""
    @Published var isShowingAccountDeletionAlert: Bool = false
    @Published var password: String = ""
    
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        let db = Firestore.firestore()

        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }

            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    username: data["username"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                    
                )
            }
        }
    }
    
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Error resetting password: \(error.localizedDescription)")
            } else {
                print("Password reset email sent.")
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
