//
//  AboutView.swift
//  Zig3
//
//  Created by Kaung Zin Lin on 9/26/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        VStack(alignment: .center) {
                            Spacer()
                            
                            Image("Zig3AppIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                                .cornerRadius(30)
                                .shadow(radius: 10)
                            
                            Text("Swiftszig")
                                .multilineTextAlignment(.center)
                                .font(.title)
                                .bold()
                                .fontDesign(.rounded)
                            
                            Text("Version 0.1 (Alpha)")
                                .fontDesign(.monospaced)
                            
                            Spacer()
                            
                            Text("Codname “Zig3”")
                                .fontDesign(.monospaced)
                                .font(.subheadline)
                            
                            Spacer()
                                
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack(alignment: .center) {
                            Text("Made with ❤️ by Kaung Zin Lin in Burma")
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    
                    Section("External Packages") {
                        ExternalPackageView(title: "AlertKit", url: "https://github.com/sparrowcode/AlertKit")
                        
                        ExternalPackageView(title: "OpenAI", url: "https://github.com/MacPaw/OpenAI/")
                        
                        ExternalPackageView(title: "PermissionsKit", url: "https://github.com/sparrowcode/PermissionsKit")
                        
                        ExternalPackageView(title: "SFSymbolsPicker", url: "https://github.com/alessiorubicini/SFSymbolsPickerForSwiftUI")
                        
                        ExternalPackageView(title: "LanguageManagerSwiftUI", url: "https://github.com/Abedalkareem/LanguageManager-SwiftUI")
                        
                        ExternalPackageView(title: "abseil", url: "https://github.com/firebase/firebase-ios-sdk")
                        
                        ExternalPackageView(title: "AppCheck", url: "https://github.com/firebase/firebase-ios-sdk")
                        
                        ExternalPackageView(title: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk")
                        
                        ExternalPackageView(title: "GoogleAppMeasurement", url: "https://github.com/firebase/firebase-ios-sdk")
                        
                        ExternalPackageView(title: "GoogleDataTransport", url: "https://github.com/firebase/firebase-ios-sdk")
                        
                        ExternalPackageView(title: "GoogleUtilities", url: "https://github.com/firebase/firebase-ios-sdk")
                        
                        ExternalPackageView(title: "gRPC", url: "https://github.com/firebase/firebase-ios-sdk")
                        
                        ExternalPackageView(title: "GTMSessionFetcher", url: "https://github.com/firebase/firebase-ios-sdk")
                        
                        ExternalPackageView(title: "InteropForGoogle", url: "https://github.com/firebase/firebase-ios-sdk")
                        ExternalPackageView(title: "leveldb", url: "https://github.com/firebase/firebase-ios-sdk")
                        
                        ExternalPackageView(title: "nanopb", url: "https://github.com/firebase/firebase-ios-sdk")
                        
                        ExternalPackageView(title: "Promises", url: "https://github.com/firebase/firebase-ios-sdk")
                        
                        ExternalPackageView(title: "SwiftProtobuf", url: "https://github.com/firebase/firebase-ios-sdk")
                    }
                }
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AboutView()
}
