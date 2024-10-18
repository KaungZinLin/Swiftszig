//
//  EasterEggView.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/12/24.
//

import SwiftUI
import YouTubePlayerKit

struct EasterEggView: View {
    var body: some View {
        VStack {
            YouTubePlayerView (
                "https://youtu.be/dQw4w9WgXcQ?si=LtkVS-2ZaXWvGvNf"
            )
        }
    }
}

#Preview {
    EasterEggView()
}
