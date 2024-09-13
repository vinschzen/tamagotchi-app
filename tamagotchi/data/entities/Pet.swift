//
//  Item.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//

import Foundation
import SwiftData

@Model
final class Pet: Identifiable {
    
    let id: UUID = UUID()
    var name: String
    var level: Float
    var hunger: Float
    var cleanliness: Float
    var happiness: Float
    
    init(name: String, level: Float, hunger: Float, cleanliness: Float, happiness: Float) {
        self.name = name
        self.level = level
        self.hunger = hunger
        self.cleanliness = cleanliness
        self.happiness = happiness
    }
}
