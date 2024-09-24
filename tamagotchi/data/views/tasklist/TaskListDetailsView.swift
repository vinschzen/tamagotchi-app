//
//  TaskListDetailsView.swift
//  tamagotchi
//
//  Created by MacBook Air on 18/09/24.
//

import SwiftUI

struct TaskListDetailsView: View {
    @Environment(\.modelContext) private var context
    var tasklist:TaskList

    var body: some View {
        VStack {
            Text("Task Details")
                .font(.system(size: 28))



            Button(action: {

            }) {

                Text("Delete Task")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding()
            }
        }

    }
}
