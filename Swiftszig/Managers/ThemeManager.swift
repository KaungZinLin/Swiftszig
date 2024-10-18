//
//  ApplyTheme.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/2/24.
//

import UIKit

func applyTheme(_ theme: Theme) {
    switch theme {
    case .auto:
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
    case .light:
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
    case .dark:
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
    }
}
