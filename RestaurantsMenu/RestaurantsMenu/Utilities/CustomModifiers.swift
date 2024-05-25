//
//  CustomModifiers.swift
//  RestaurantsMenu
//
//  Created by Sahith D on 5/23/24.
//
import SwiftUI
struct CustomRoundedImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            .shadow(radius: 5)
    }
}

extension View {
    func roundedImage() -> some View {
        self.modifier(CustomRoundedImage())
    }
}

