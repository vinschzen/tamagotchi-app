//
//  TaskItemView.swift
//  tamagotchi
//
//  Created by MacBook Air on 13/09/24.
//

import Foundation
import SwiftUI

struct TaskItemView: View {
    let addedTasks: [TaskItem]

    
//    let name: String
//    let date: Date
//    let time: String
    
    var body: some View {
            ForEach(addedTasks) { t in
                VStack(alignment: .leading) {
                    Text(t.name)
                    .font(.headline)
                Spacer()
                HStack(alignment: .bottom) {
                    Spacer()
                    Text(t.date.formatted(.dateTime) + t.time)
                        .font(.caption)
                }
                
            }
        }
        .padding()
    }
}
