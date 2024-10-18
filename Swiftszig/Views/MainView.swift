//
//  MainView.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/1/24.
//

import SwiftUI

struct MainView: View {
    @StateObject private var networkManager = NetworkViewModel()
    @StateObject private var viewModel = MainViewViewModel()
    
    @AppStorage("userTheme") private var userTheme: Theme = .auto
    
    var body: some View {
        if networkManager.isActive {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                TaskView(userId: viewModel.currentUserId)
                    .onAppear {
                        applyTheme(userTheme)
                    }
                
            } else {
                OnboardView()
            }
            
        } else {
            NoInternetView()
        }
    }
}

#Preview {
    MainView()
}
