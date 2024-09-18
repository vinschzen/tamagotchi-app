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
    
    let BACKGROUND_COLORS: [Color] = [
        .init(red: 173/255, green: 255/255, blue: 181/255),  // Pastel Green
        .init(red: 153/255, green: 204/255, blue: 255/255), // Pastel Blue
        .init(red: 255/255, green: 182/255, blue: 193/255) // Pastel Red
    ]

    
    var body: some View {
            ForEach(addedTasks) { t in
                VStack(alignment: .leading) {
                    Text(t.name)
                    .font(.headline)
                    .background(BACKGROUND_COLORS[t.priority])
                Spacer()
                HStack(alignment: .bottom) {
                    Spacer()
                    Text(t.date.formatted(.dateTime))
                        .font(.caption)
                }
            }

        }
        .padding()
        
    }
}
