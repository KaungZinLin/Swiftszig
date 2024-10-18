//
//  ExternalPackageView.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/1/24.
//

import SwiftUI

struct ExternalPackageView: View {
    let title: LocalizedStringResource
    let url: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
            }
            
            Spacer()
            
            Link(destination: URL(string: url)!) {
                Image(systemName: "arrow.up.right.square")
            }
        }
        .padding(.vertical, 4)
    }
}

