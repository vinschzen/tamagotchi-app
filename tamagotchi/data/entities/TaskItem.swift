//
//  Item.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//

import Foundation

struct TaskItem: Identifiable, Codable {
    var id: String
    var name: String
    var difficulty: Int
    var date: Date
    var time: String
    var priority: Int
    var finished: Bool
}
