//
//  NoInternetView.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/12/24.
//

import SwiftUI

struct NoInternetView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.red
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundStyle(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundStyle(.white)

                VStack {
                    Image(systemName: "wifi.slash")
                        .font(.system(size: 100))
                        .foregroundStyle(.red)
                        .padding()
                    
                    if colorScheme == .dark {
                        Text("No Internet Connection")
                            .font(.title)
                            .fontDesign(.rounded)
                            .bold()
                            .foregroundStyle(.black)
                    } else {
                        Text("No Internet Connection")
                            .font(.title)
                            .fontDesign(.rounded)
                            .bold()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    NoInternetView()
}
