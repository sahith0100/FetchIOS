//
//  Item.swift
//  RestaurantsMenu
//
//  Created by Sahith D on 5/23/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
