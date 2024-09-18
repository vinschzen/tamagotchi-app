//
//  Item.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//

import Foundation
import SwiftData

@Model
final class Notification: Identifiable {
    
    let id: UUID = UUID()
    var title: String
    var content: String
    var from: String
    
    init(title: String, content: String, from: String) {
        self.title = title
        self.content = content
        self.from = from
    }
}


