//
//  ORSQAIView.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/2/24.
//

import SwiftUI

struct ORSQAIView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        VStack(alignment: .center) {
                            Spacer()
                            
                            Image("ORSQAIIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                                .cornerRadius(30)
                                .shadow(radius: 10)
                            
                            Text("ORSQ AI")
                                .multilineTextAlignment(.center)
                                .font(.title)
                                .bold()
                                .fontDesign(.rounded)
                            
                            Text("Powered by OpenAI's ChatGPT. Optimized for Switszig.")
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    Section("Recommended") {
                        Button(action: {
                            // Add your action code here
                        }) {
                            Label("Upgrade to Swiftszig Pro", systemImage: "bag.fill")
                                .labelStyle(ColorfulIconLabelStyle(color: .blue))
                        }
                    }
                    
                    Section(header: Text("Already have an OpenAI API Key?"), footer: Text("Use your own API Key to power ORSQ AI.")) {
                        NavigationLink(destination: OpenAIAPIKeyManagementView(comesFromOnboardScreen: false)) {
                            Label("Add an OpenAI API Key", systemImage: "key.fill")
                                .labelStyle(ColorfulIconLabelStyle(color: .green))
                        }
                    }
                }
            }
            .navigationTitle("ORSQ AI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ORSQAIView()
}
