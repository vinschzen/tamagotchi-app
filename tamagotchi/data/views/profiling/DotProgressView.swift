//
//  DotProgressView.swift
//  tamagotchi
//
//  Created by MacBook Air on 20/09/24.
//

import SwiftUI

struct DotProgressView: View {
    let totalSteps: Int
    @Binding var currentIndex: Int
    @Binding var progress: Double
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalSteps, id: \.self) { index in
                if index == currentIndex {
                    // Green Dot (active with progress fill from left to right)
                    ZStack(alignment: .leading) {
                        // Background (gray)
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 30, height: 10)
                        
                        // Foreground (green, animated fill from left)
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.green)
                            .frame(width: 30 * CGFloat(progress), height: 10)
                            .animation(.linear(duration: 0.05), value: progress)
                    }
                } else {
                    // Gray Dots (inactive)
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 10, height: 10)
                }
            }
        }
    }
}
