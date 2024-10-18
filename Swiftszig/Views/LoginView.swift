//
//  LoginView.swift
//  Zig3
//
//  Created by Kaung Zin Lin on 9/29/24.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State private var isShowingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if colorScheme == .dark {
                    Color.teal
                        .opacity(0.8)
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.7)
                        .foregroundStyle( Color.black.opacity(0.15))
                    
                    Circle()
                        .scale(1.35)
                        .foregroundStyle(Color.black)
                } else {
                    Color.blue
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.7)
                        .foregroundStyle( Color.white.opacity(0.15))
                    
                    Circle()
                        .scale(1.35)
                        .foregroundStyle(Color.white)
                }
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .fontDesign(.rounded)
                        .bold()
                    
                    TextField("Email Address", text: $viewModel.email)
                        .padding()
                        .frame(width: 300, height: 50)
                        
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Button {
                                    hideInputKeyboard()
                                } label: {
                                    Image(systemName: "keyboard.chevron.compact.down")
                                }
                            }
                        }
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    if colorScheme == .dark {
                        Button("Login") {
                            viewModel.login()
                            if !viewModel.error.isEmpty {
                                isShowingAlert = true
                            }
                        }
                        .padding()
                        .frame(width: 270, height: 15)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.teal)
                        .opacity(0.8)
                        .cornerRadius(20)
                        .alert("Cannot Login to your Account", isPresented: $isShowingAlert) {
                            Button("OK", role: .cancel) {
                                
                            }
                        } message: {
                            Text(viewModel.error)
                        }
                        
                        VStack {
                            Text("Don't have an account?")
                            NavigationLink(destination: CreateAccountView()) {
                                Text("Create an Account")
                            }
                            .foregroundStyle(.teal)
                            .opacity(0.8)
                        }
                        .padding()
                    } else {
                        Button("Login") {
                            viewModel.login()
                            if !viewModel.error.isEmpty {
                                isShowingAlert = true
                            }
                        }
                        .padding()
                        .frame(width: 270, height: 15)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(20)
                        .alert("Cannot Login to your Account", isPresented: $isShowingAlert) {
                            Button("OK", role: .cancel) {
                                
                            }
                        } message: {
                            Text(viewModel.error)
                        }
                        
                        VStack {
                            Text("Don't have an account?")
                            NavigationLink(destination: CreateAccountView()) {
                                Text("Create an Account")
                            }
                            .foregroundStyle(.blue)
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
