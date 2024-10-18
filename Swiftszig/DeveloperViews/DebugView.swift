//
//  DebugMenu.swift
//  Zig3
//
//  Created by Kaung Zin Lin on 9/25/24.
//

import SwiftUI

struct DebugView: View {
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Oboarding (Welcome/Intro) Screen"), footer: Text("This action will not delete your data.")) {
                        Button("Reset Onboarding") {
                            hasLaunchedBefore = false
                            fatalError("Reset Onboarding")
                        }
                    }
                }
                
            }
            .navigationTitle("Debug")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DebugView()
}
