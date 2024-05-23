//
//  ArrayExtension.swift
//  RestaurantsMenu
//
//  Created by Sahith D on 5/24/24.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
