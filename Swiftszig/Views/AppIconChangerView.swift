//
//  AppIconChangerView.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/2/24.
//

import SwiftUI

struct AppIconChangerView: View {
    @AppStorage("currentIcon") var currentIcon: String = "AppIcon"
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("App Icon Selection") {
                        Text("Current Icon: \( UIApplication.shared.alternateIconName ?? "Default (Auto)")")
                        
                        HStack {
                            Image("SwiftszigLight")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .cornerRadius(25)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Default (Auto)")
                                    .font(.title3)
                                    .fontDesign(.rounded)
                                    .bold()
                                
                                Text("Designed by Kaung Zin Lin")
                            }
                        }
                        .onTapGesture {
                            UIApplication.shared.setAlternateIconName("AppIcon")
                        }
                        
                        HStack {
                            Image("SwiftszigLight")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .cornerRadius(25)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Light")
                                    .font(.title3)
                                    .fontDesign(.rounded)
                                    .bold()
                                
                                Text("Designed by Kaung Zin Lin")
                            }
                        }
                        .onTapGesture {
                            UIApplication.shared.setAlternateIconName("AppIconLight")
                        }
                        
                        HStack {
                            Image("SwiftszigDark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .cornerRadius(25)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Dark")
                                    .font(.title3)
                                    .fontDesign(.rounded)
                                    .bold()
                                
                                Text("Designed by Kaung Zin Lin")
                            }
                        }
                        .onTapGesture {
                            UIApplication.shared.setAlternateIconName("AppIconDark")
                        }
                    }
                }
            }
            .navigationTitle("App Icon")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AppIconChangerView()
}
