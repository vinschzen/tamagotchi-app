//
//  CollapsibleListChildren.swift
//  tamagotchi
//
//  Created by MacBook Air on 18/09/24.
//

import SwiftUI
import SwiftData

struct CollapsibleListChildren: View {
@State var tasklist: [TaskItem]

  var body: some View {
      ForEach(tasklist) { t in
          HStack {
              Image(systemName: t.finished
                    ? "largecircle.fill.circle"
                    : "circle"
              )
              .imageScale(.large)
              .foregroundColor(.accentColor)
              .onTapGesture {
                  t.finished.toggle()
              }
              Text(t.name)
                  .frame(maxWidth: .infinity, alignment: .leading)
              
          }
      }
  }
    
    private func updateItem(_ item: TaskItem) {
        withAnimation {
            item.finished.toggle()
        }
    }
}


