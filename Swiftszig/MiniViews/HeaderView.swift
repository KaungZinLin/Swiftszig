//
//  HeaderView.swift
//  Zig3
//
//  Created by Kaung Zin Lin on 9/29/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color
    let angle: Double
    let imageName: String
    let doesIncludeImage: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                if doesIncludeImage {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .cornerRadius(30)
                }

                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.rounded)
                
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "sds", subtitle: "sdsd", background: Color.green, angle: -15, imageName: "Zig3AppIcon", doesIncludeImage: true)
}
