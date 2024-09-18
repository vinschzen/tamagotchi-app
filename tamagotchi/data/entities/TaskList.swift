
import Foundation
import SwiftData

@Model
final class TaskList: ObservableObject {
    @Attribute(.unique) var id: String = UUID().uuidString
    
    @Relationship(inverse: \TaskItem.list) var tasklist: [TaskItem]?

    var title: String
    var shared: Bool

    init(title: String, shared: Bool, tasklist: [TaskItem] ) {
        self.title = title
        self.shared = shared
        self.tasklist = tasklist
    }
}
