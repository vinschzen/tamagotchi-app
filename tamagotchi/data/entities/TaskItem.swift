//
//  Item.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//
import Foundation
import SwiftData

@Model
final class TaskItem: ObservableObject {
    @Attribute(.unique) var id: String = UUID().uuidString

    var list: TaskList?
    var name: String
    var difficulty: Int
    var date: Date
    var time: String
    var priority: Int
    var finished: Bool

    init(name: String, difficulty: Int, date: Date, time: String, priority: Int, finished: Bool ) {
        self.name = name
        self.difficulty = difficulty
        self.date = date
        self.time = time
        self.priority = priority
        self.finished = false
    }
}
