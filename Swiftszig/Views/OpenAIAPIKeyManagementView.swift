//
//  OpenAIAPIKeyManagementView.swift
//  Zig3
//
//  Created by Kaung Zin Lin on 9/25/24.
//

import SwiftUI
import AlertKit

struct OpenAIAPIKeyManagementView: View {
    @State private var apiInput: String = ""
    @Environment(\.dismiss) var dismiss
    @State private var isShowingAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var buttonText: String = ""
    @AppStorage("openAIAPIKey") private var apiKey: String = ""
    @State var comesFromOnboardScreen: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Your OpenAI API Key"), footer: Text("Your API Key will be stored locally on your iPhone and will not be synced to the cloud.")) {
                        if apiKey.isEmpty {
                            Label("No OpenAI API Key Added!", systemImage: "xmark.circle.fill")
                                .foregroundStyle(.red)
                        } else {
                            Label("\(apiKey)", systemImage: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                        }
                    }
                    
                    Section("OpenAI API Key") {
                        TextField("Insert your API Key Here", text: $apiInput)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Button {
                                        hideInputKeyboard()
                                    } label: {
                                        Image(systemName: "keyboard.chevron.compact.down")
                                    }
                                }
                            }
                        
                        Button("Save") {
                            if apiInput.isEmpty {
                                AlertKitAPI.present(
                                    title: "Please provide a valid OpenAI API Key!",
                                    icon: .error,
                                    style: .iOS17AppleMusic,
                                    haptic: .error
                                )
                            } else {
                                alertTitle = "Changes Detected"
                                alertMessage = "Press 'Restart Now' to apply new changes across the app."
                                buttonText = "Restart Now"
                                
                                apiKey = apiInput
                                isShowingAlert = true
                            }
                        }
                    }
                }
            }
            .navigationTitle("Add an OpenAI API Key")
            .navigationBarTitleDisplayMode(.inline)
            .alert(alertTitle, isPresented: $isShowingAlert) {
                Button("\(buttonText)") {
                    fatalError("App Restart requested by User.")
                }
            } message: {
                Text(alertMessage)
            }
            .toolbar {
                if comesFromOnboardScreen {
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .font(.title2)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    OpenAIAPIKeyManagementView(comesFromOnboardScreen: false)
}
