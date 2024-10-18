//
//  SwiftszigApp.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 9/30/24.
//

import SwiftUI
import FirebaseCore
import LanguageManagerSwiftUI

@main
struct SwiftszigApp: App {
    @AppStorage("userTheme") private var userTheme: Theme = .auto
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LanguageManagerView(.deviceLanguage) {
                SplashScreenView()
                    .onAppear {
                        applyTheme(userTheme)
                    }
                    .transition(.slide)
            }
        }
    }
}
