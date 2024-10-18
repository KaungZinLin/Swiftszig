//
//  ErrorView.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/1/24.
//

import SwiftUI

struct ErrorView: View {
    let title: LocalizedStringResource
    let description: LocalizedStringResource
    let sfSymbol: String
    let includesDescription: Bool
    let alignment: String
    
    var body: some View {
        if includesDescription == true && alignment == "C" {
            VStack(alignment: .center) {
                Label("\(title)", systemImage: sfSymbol)
                    .foregroundStyle(.red)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Text(description)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
        } else if includesDescription == false && alignment == "L" {
            VStack(alignment: .leading) {
                Label("\(title)", systemImage: sfSymbol)
                    .foregroundStyle(.red)
                    .bold()
                    .multilineTextAlignment(.center)
            }
        }
    }
}
