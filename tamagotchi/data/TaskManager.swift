

import SwiftUI
import Foundation
import Firebase
import FirebaseFirestore

class TaskViewModel: ObservableObject {
    
    @Published var list: [TaskList] = []
    
//    private var dummyList: [TaskItem] = [
//        TaskItem(name: "Item 1", difficulty: 0, date: Date(), time: "00:00", priority: 1, finished: false),
//        TaskItem(name: "Item 2", difficulty: 0, date: Date(), time: "00:00", priority: 2, finished: false),
//        TaskItem(name: "Item 3", difficulty: 0, date: Date(), time: "00:00", priority: 3, finished: false),
//    ]
    
    func addList(tasklist: TaskList) {
        let db = Firestore.firestore()
        var taskData: [[String: Any]] = []
        tasklist.tasklist!.forEach() { t in
            taskData.append([
                "list": tasklist.id,
                "name": t.name,
                "difficulty": t.difficulty,
                "date": t.date,
                "time": t.time,
                "priority": t.priority,
                "finished": false
            ])
        }
        
        var tasklistData: [String: Any] = [
            "title": tasklist.title,
            "shared": true,
            "tasklist": taskData
        ]
        
        db.collection("tasklists").document(tasklist.id).setData(tasklistData) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added with ID: \(tasklistData)")
            }
        }
        
        
    }
    
    func fetchItemFromList(listid: String) -> [TaskItem] {
        let db = Firestore.firestore()

        var taskitems:[TaskItem] = []
        
        db.collection("taskitems")
            .whereField("list", isEqualTo: listid).getDocuments() { (queryItemSnapshot, itemError) in
                
            if let itemError = itemError {
                    print("Error getting documents: \(itemError)")
            } else {
                    for itemDocument in queryItemSnapshot!.documents {
                        print("Item : \(itemDocument.documentID): \(itemDocument.data())")
                        let timestamp: Timestamp = itemDocument.data()["date"] as! Timestamp

                        taskitems.append(
                            TaskItem(name: itemDocument.data()["name"] as! String,
                                    difficulty: 0,
                                    date: timestamp.dateValue(),
                                    time:  itemDocument.data()["time"] as! String,
                                    priority:  itemDocument.data()["priority"] as! Int,
                                    finished: false
                            )
                        )
                        
                        
                    }
                
            }
            print("Taskitems.appended : \(taskitems.description)")
        }
        print("Taskitems.appended returning: \(taskitems.description)")

        return taskitems
        
    }
    
    func fetchTasklists() {
        if !list.isEmpty {
            list = []
        }
        
        let db = Firestore.firestore()
        
        db.collection("tasklists").whereField("shared", isEqualTo: true)
          .addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
              print("Error fetching documents: \(error!)")
              return
            }
              for document in querySnapshot!.documents {
                  var temptasklist = document.data()["tasklist"] as! [[String:Any]]
                  var tasklist:[TaskItem] = []
                  
                  temptasklist.forEach{ t in
                      let timestamp: Timestamp = t["date"] as! Timestamp
                      tasklist.append(
                        TaskItem(
                            name: t["name"] as! String,
                            difficulty: 0,
                            date: timestamp.dateValue(),
                            time: t["time"] as! String,
                            priority: t["priority"] as! Int,
                            finished: false
                        )
                      )
                  }
                 
                  self.list.append(
                        TaskList(
                            title: document.data()["title"] as! String,
                            shared: true,
                            tasklist: [
//                                TaskItem(
//                                    name: "tasl",
//                                    difficulty: 0,
//                                    date: Date(),
//                                    time: "00:00",
//                                    priority: 1,
//                                    finished: false)
                            ]
                        )
                  )
                  
              }
              
              
          }
        
//        db.collection("tasklists").getDocuments() { (querySnapshot, error) in
//            if let error = error {
//                    print("Error getting documents: \(error)")
//            } else {
//                    for document in querySnapshot!.documents {
//                        print("Tasklist : \(document.documentID): \(document.data())")
//                        
//                        let temptasklist = self.fetchItemFromList(listid: document.documentID)
//                        print("Temptasklist : \(temptasklist)")
//                        
//                        self.list.append(
//                            TaskList(
//                                title: document.data()["title"] as! String,
//                                shared: true,
//                                tasklist: temptasklist
//                            )
//                        )
//                        
//                        
//                    }
//            }
//        }
    }
}
