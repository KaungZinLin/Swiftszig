//
//  KeyboardHider.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/1/24.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideInputKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
