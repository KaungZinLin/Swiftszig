//
//  LanguageView.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/3/24.
//

import SwiftUI
import LanguageManagerSwiftUI

struct LanguageView: View {
    @EnvironmentObject var languageSettings: LanguageSettings
    
    @Environment(\.colorScheme) var colorScheme

    func colorForScheme() -> Color {
        return colorScheme == .light ? .black : .white
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Interface Language") {
                        Label("Tap on any language to change.", systemImage: "info.circle")
                        
                        Button(action: {
                            withAnimation {
                                languageSettings.selectedLanguage = .en
                            }
                        }) {
                            HStack {
                                Text("🇺🇸")
                                    .font(.title)
                                
                                VStack(alignment: .leading) {
                                    Text("English")
                                        .font(.headline)
                                        .foregroundStyle(colorForScheme())
                                    
//                                    Text("Arabic")
//                                        .font(.subheadline)
//                                        .foregroundStyle(colorForScheme())
                                }
                            }
                        }
 
                        Button(action: {
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }) {
                            HStack {
                                Image("BurmaFlag")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                
                                VStack(alignment: .leading) {
                                    Text("ဗမာစာ")
                                        .font(.headline)
                                        .foregroundStyle(colorForScheme())
                                    
                                    Text("Burmese")
                                        .font(.subheadline)
                                        .foregroundStyle(colorForScheme())
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Language")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LanguageView()
}
