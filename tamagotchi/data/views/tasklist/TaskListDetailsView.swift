//
//  TaskListDetailsView.swift
//  tamagotchi
//
//  Created by MacBook Air on 18/09/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct TaskListDetailsView: View {
    @Environment(\.modelContext) private var context
    
    @ObservedObject var model = TaskViewModel()
    
    @State private var showAlert = false
    
    var tasklist:TaskList

    var body: some View {
        VStack {
            Text(tasklist.title)
                .font(.system(size: 28))
                .padding()
            
            List{
                TaskItemView(addedTasks: tasklist.tasklist!)
            }
            
            Button(action: {
                share(tasklist: tasklist)
            }) {

                Text("Share Tasklist")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .padding()
            }
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Shared"), message: Text("Tasklist \(tasklist.title) has been shared to public"))
        }

    }
    
    private func share(tasklist: TaskList) {
        model.addList(tasklist: tasklist)
        
    }
}
