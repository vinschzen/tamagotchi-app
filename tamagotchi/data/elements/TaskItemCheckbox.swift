//
//  TaskItemView.swift
//  tamagotchi
//
//  Created by MacBook Air on 13/09/24.
//

import Foundation
import SwiftUI

struct TaskItemCheckbox
: View {
    @State var item: TaskItem
    
    var body: some View {
        HStack {
            Image(systemName: item.finished
                  ? "largecircle.fill.circle"
                  : "circle"
            )
            .imageScale(.large)
            .foregroundColor(.accentColor)
            .onTapGesture {
                item.finished.toggle()
            }
            Text(item.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                
        }
    }
}
