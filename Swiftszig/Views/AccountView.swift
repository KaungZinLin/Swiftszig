//
//  AccountView.swift
//  Zig3
//
//  Created by Kaung Zin Lin on 9/29/24.
//

import SwiftUI
import AlertKit

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @State private var email: String = ""
    @State private var isShowingResetPasswordAlert: Bool = false
    @State private var isShowingLogOutConfirmationAlert: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.user {
                    Form {
                        Section {
                            VStack(alignment: .center) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(30)
                                    .shadow(radius: 10)
                                    .multilineTextAlignment(.leading)
                                
                                Text(user.name)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                
                                Text(user.username)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                        Section("Account Information") {
                            Label(user.email, systemImage: "envelope.fill")
                            
                            Label("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))", systemImage: "calendar")
                        }
                        
                        Section("Sign-in & Security") {
                            Button("Reset Password") {
                                isShowingResetPasswordAlert = true
                            }
                            .foregroundStyle(.red)
                            .alert("Password Reset Request", isPresented: $isShowingResetPasswordAlert) {
                                TextField("Email", text: $email)
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.never)
                                    .keyboardType(.emailAddress)
                                
                                Button("Reset") {
                                    if !email.isEmpty {
                                        viewModel.resetPassword(email: email)
                                    } else {
                                        AlertKitAPI.present(
                                            title: "Invalid Email Address",
                                            icon: .error,
                                            style: .iOS17AppleMusic,
                                            haptic: .error
                                        )
                                    }
                                }
                                
                                Button("Cancel", role: .cancel) {
                                    
                                }
                            } message: {
                                Text("An email will be sent to you with a link to reset your password.")
                            }
                            
                            Button("Log Out") {
                                isShowingLogOutConfirmationAlert = true
                            }
                            .foregroundStyle(.red)
                        }
                    }
                    .onAppear {
                        viewModel.fetchUser()
                    }
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("My Account")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Are you sure do you want to log out of your account?", isPresented: $isShowingLogOutConfirmationAlert) {
                Button("Cancel", role: .cancel) {
                    
                }
                
                Button("Log Out", role: .destructive) {
                    viewModel.logout()
                }
            }
            .onAppear {
                viewModel.fetchUser()
            }
        }
    }
}

#Preview {
    AccountView()
}
