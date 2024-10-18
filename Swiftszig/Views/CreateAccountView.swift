//
//  CreateAccountView.swift
//  Zig3
//
//  Created by Kaung Zin Lin on 9/29/24.
//

import SwiftUI

struct CreateAccountView: View {
    @StateObject private var viewModel = CreateAccountViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State private var isShowingAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if colorScheme == .dark {
                    Color.mint
                        .opacity(0.8)
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.7)
                        .foregroundStyle( Color.black.opacity(0.15))
                    
                    Circle()
                        .scale(1.35)
                        .foregroundStyle(Color.black)
                } else {
                    Color.green
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.7)
                        .foregroundStyle( Color.white.opacity(0.15))
                    
                    Circle()
                        .scale(1.35)
                        .foregroundStyle(Color.white)
                }
                
                VStack {
                    Text("Create Account")
                        .font(.largeTitle)
                        .fontDesign(.rounded)
                        .bold()
                    
                    TextField("Name (e.g. John Doe)", text: $viewModel.name)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
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
                    
                    TextField("Username (e.g. john)", text: $viewModel.username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    TextField("Email Address", text: $viewModel.email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    if colorScheme == .dark {
                        Button("Create") {
                            viewModel.create()
                            if !viewModel.error.isEmpty {
                                isShowingAlert = true
                            }
                        }
                        .padding()
                        .frame(width: 270, height: 15)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.mint)
                        .opacity(0.8)
                        .cornerRadius(20)
                        .alert("Cannot Create your Account", isPresented: $isShowingAlert) {
                            Button("OK", role: .cancel) {
                               
                            }
                        } message: {
                            Text(viewModel.error)
                        }
                    } else {
                        Button("Create") {
                            viewModel.create()
                            if !viewModel.error.isEmpty {
                                isShowingAlert = true
                            }
                        }
                        .padding()
                        .frame(width: 270, height: 15)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.green)
                        .cornerRadius(20)
                        .alert("Cannot Create your Account", isPresented: $isShowingAlert) {
                            Button("OK", role: .cancel) {
                               
                            }
                        } message: {
                            Text(viewModel.error)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CreateAccountView()
}
