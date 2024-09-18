
import Foundation
import SwiftData

@Model
final class TaskList: ObservableObject {
    @Attribute(.unique) var id: String = UUID().uuidString

    var title: String
    var shared: Bool
    var tasklist: [TaskItem]
    
    init(title: String, shared: Bool, tasklist: [TaskItem] ) {
        self.title = title
        self.shared = shared
        self.tasklist = tasklist
    }
}
