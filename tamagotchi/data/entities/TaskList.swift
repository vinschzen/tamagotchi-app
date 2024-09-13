
import Foundation
import SwiftData


//final class TaskList: Identifiable {
//    
//    let id: UUID = UUID()
//    var title: String
//    var shared: Bool
//    var upvote: Int
//    
//    var tasks: Array<TaskItem>
//    
//    init(title: String, shared: Bool, upvote: Int, tasks: Array<TaskItem>) {
//        self.title = title
//        self.shared = shared
//        self.upvote = upvote
//        self.tasks = tasks
//    }
//}

import Foundation

struct TaskList: Identifiable, Codable {
    var id: String
    var created_by: String
    var owned_by: String
    let title: String
    let shared: Bool
    let upvote: Int
}
