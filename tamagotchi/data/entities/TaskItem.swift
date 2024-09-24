//
//  Item.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//
import Foundation
import SwiftData

@Model
final class TaskItem: Codable {
    enum CodingKeys: CodingKey {
        case id, list, name, difficulty, date, time, priority, finished
    }
    
    @Attribute(.unique) var id: String = UUID().uuidString

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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        difficulty = try container.decode(Int.self, forKey: .difficulty)
        date = try container.decode(Date.self, forKey: .date)
        time = try container.decode(String.self, forKey: .time)
        priority = try container.decode(Int.self, forKey: .priority)
        finished = try container.decode(Bool.self, forKey: .finished)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(difficulty, forKey: .difficulty)
        try container.encode(date, forKey: .date)
        try container.encode(time, forKey: .time)
        try container.encode(priority, forKey: .priority)
        try container.encode(finished, forKey: .finished)
    }
}
