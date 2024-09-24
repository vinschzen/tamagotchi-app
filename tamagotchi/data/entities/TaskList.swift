
import Foundation
import SwiftData

@Model
final class TaskList: Codable {
    enum CodingKeys: CodingKey {
        case id, title, shared, tasklist
    }
    
    @Attribute(.unique) var id: String = UUID().uuidString
    
    var tasklist: [TaskItem]?

    var title: String
    var shared: Bool

    init(title: String, shared: Bool, tasklist: [TaskItem] ) {
        self.title = title
        self.shared = shared
        self.tasklist = tasklist
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        shared = try container.decode(Bool.self, forKey: .shared)
        tasklist = try container.decode([TaskItem].self, forKey: .tasklist)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(shared, forKey: .shared)
        try container.encode(tasklist, forKey: .tasklist)
    }
}
