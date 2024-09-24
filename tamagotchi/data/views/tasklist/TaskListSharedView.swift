//
//  TaskListDetailsView.swift
//  tamagotchi
//
//  Created by MacBook Air on 18/09/24.
//

import SwiftUI

struct TaskListSharedView: View {
    @Environment(\.modelContext) private var context
    
    @ObservedObject var model = TaskViewModel()
    
    @State private var didAppear: Bool = false
    
    var body: some View {
        VStack {
            List(model.list) { l in
                SharedRowView(tasklist: l)
            }
            .overlay(
                Group {
                    if model.list.isEmpty {
                        ThreeDots()
                        Text("Finding your lists...")
                            .foregroundColor(.gray)
                    }
                }
            )
            
        }.navigationBarTitle("Shared Lists", displayMode: .inline)
            .onAppear() {
                if !didAppear  {
//                    model.getSharedList { tasklists in
//                        DispatchQueue.main.async {
//                            model.list = tasklists!
//                        }
//                    }
                    model.fetchTasklists()
                    didAppear = true
                }
            }
    }
    
    
}
