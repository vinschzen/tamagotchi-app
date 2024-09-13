import Firebase

class TaskListRepository {
    private let ref = Database.database().reference().child("tasklist")

    func fetch() async -> TaskList? {
//        do {
//            let snapshot = try await ref.childByAutoId().observeSingleEvent(of: .value)
//            let value = snapshot.value as? [String: Any] ?? [:]
//
//            guard let tasks = value["tasks"] as? [String: Any],
//                  let title = value["title"] as? String,
//                  let shared = value["shared"] as? Bool,
//                  let upvote = value["upvote"] as? Int else {
//                return nil
//            }
//
//            let taskList = TaskList(
//                tasks: tasks.compactMap { TaskItem(from: $0.value) },
//                title: title,
//                shared: shared,
//                upvote: upvote
//            )
//
//            return taskList
//        } catch {
//            print("Error fetching task list: \(error)")
//            return nil
//        }
    }

    // ... other repository methods for creating, updating, and deleting tasks
}

extension Task {
    init?(from value: Any) {
        guard let dict = value as? [String: Any],
              let name = dict["name"] as? String,
              let difficulty = dict["difficulty"] as? Int,
              let priority = dict["priority"] as? Int,
              let finished = dict["finished"] as? Bool else {
            return nil
        }

        self.name = name
        self.difficulty = difficulty
        self.priority = priority
        self.finished = finished
    }
}
