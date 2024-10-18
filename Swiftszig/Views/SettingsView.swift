//
//  SettingsVie.swift
//  Zig3
//
//  Created by Kaung Zin Lin on 9/25/24.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @StateObject private var accountManagement = MainViewViewModel()
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.requestReview) var requestReview
    @State var isUsingSubscription: Bool = false
    
    @Environment(\.colorScheme) private var scheme
    @AppStorage("userTheme") private var userTheme: Theme = .auto
    @Environment(\.scenePhase) var scenePhase
    
    @Environment(\.colorScheme) var colorScheme

    func colorForScheme() -> Color {
        return colorScheme == .light ? .black : .white
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Account") {
                        NavigationLink(destination: AccountView()) {
                            Label("My Account", systemImage: "person.fill")
                                .labelStyle(ColorfulIconLabelStyle(color: .gray))
                        }
                    }
                    
                    Section("Artificial Intelligence") {
                        NavigationLink(destination: ORSQAIView()) {
                            Label("ORSQ AI", systemImage: "brain.head.profile.fill")
                                .labelStyle(ColorfulIconLabelStyle(color: .green))
                        }
                    }
                    
                    Section("Customization") {
                        Picker(selection: $userTheme, label: VStack {
                            Label("Theme", systemImage: "paintbrush.fill")
                                .labelStyle(ColorfulIconLabelStyle(color: .mint))
                        }) {
                            ForEach(Theme.allCases, id: \.self) { theme in
                                Text(theme.rawValue).tag(theme)
                            }
                        }
                        .pickerStyle(NavigationLinkPickerStyle())
                        .onChange(of: scenePhase) { newScenePhase in
                            applyTheme(userTheme)
                        }

                        NavigationLink(destination: AppIconChangerView()) {
                            Label("App Icon", systemImage: "app.badge.fill")
                                .labelStyle(ColorfulIconLabelStyle(color: .pink))
                        }
                    }
                    
                    Section("General") {
                        NavigationLink(destination: LanguageView()) {
                            Label("Language", systemImage: "globe")
                                .labelStyle(ColorfulIconLabelStyle(color: .indigo))
                        }
                    }
                    
                    Section("Feedback") {
                        Button(action: {
                           requestReview()
                        }) {
                            Label("Rate on the App Store", systemImage: "star.bubble.fill")
                                .labelStyle(ColorfulIconLabelStyle(color: .purple))
                                .foregroundStyle(colorForScheme())
                        }
                        
                        Button(action: {
                            
                        }) {
                            Label("Report Bug (coming soon!)", systemImage: "ladybug.fill")
                                .labelStyle(ColorfulIconLabelStyle(color: .red))
                                .foregroundStyle(colorForScheme())
                        }
                    }
                    
                    Section("Other") {
                        NavigationLink(destination: AboutView()) {
                            Label("About", systemImage: "info.circle.fill")
                                .labelStyle(ColorfulIconLabelStyle(color: .orange))
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                   Button(action: {
                       dismiss()
                   }) {
                       Image(systemName: "xmark")
                       
                   }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(" ", destination: EasterEggView())
                        .foregroundStyle(.secondary)
                }
            }
            .onAppear {
                applyTheme(userTheme)
            }
        }
    }
}

#Preview {
    SettingsView()
}

enum Theme: String, CaseIterable {
    case auto = "Default (Auto)"
    case light = "Light"
    case dark = "Dark"
}
