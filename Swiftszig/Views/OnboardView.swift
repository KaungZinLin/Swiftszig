//
//  OnboardView.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/9/24.
//

import SwiftUI

struct OnboardView: View {
    var body: some View {
        NavigationStack {
            TabView {
                OnboardItemView(imageName: "Zig3AppIcon", title: "Swiftszig", description: "Swiftszig is the most unique AI-powered daily planner for your iPhone.", emoji: "", includesEmoji: false)
                
                OnboardItemView(imageName: "ORSQAIIcon", title: "Powered by AI", description: "ORSQ AI - Powered by ChatGPT. Optimized for Swiftszig and will help your plan tasks better!", emoji: "", includesEmoji: false)
                
                OnboardItemView(imageName: "", title: "Cloud Sync", description: "Your tasks are synced with your account on the cloud. And, your tasks can also be accessed from your Mac or iPad.", emoji: "☁️", includesEmoji: true)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            NavigationLink(destination: LoginView()) {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
        }
    }
}

struct OnboardItemView: View {
    let imageName: String
    let title: String
    let description: String
    let emoji: String
    let includesEmoji: Bool
    
    var body: some View {
        VStack {
            if includesEmoji {
                VStack(alignment: .center) {
                    Text(emoji)
                        .font(.system(size: 150))
                        .bold()
                    
                    Text(title)
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.rounded)

                    Text(description)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()
            } else {
                VStack(alignment: .center) {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .cornerRadius(30)
                        .shadow(radius: 10)
                    
                    Text(title)
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.rounded)

                    Text(description)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
        }
    }
}

#Preview {
    OnboardView()
}
