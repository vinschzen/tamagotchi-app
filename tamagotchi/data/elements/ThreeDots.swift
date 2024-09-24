//
//  ThreeDots.swift
//  tamagotchi
//
//  Created by MacBook Air on 23/09/24.
//

import Foundation
import SwiftUI

extension Color {
    static let background: Color = Color(UIColor.systemBackground)
    static let label: Color = Color(UIColor.label)
    static let circleTrackStart: Color = Color(red: 237/255, green: 250/255, blue: 255/255)
    static let circleTrackEnd: Color = Color(red: 235/255, green: 248/255, blue: 255/255)
    static let circleRoundStart: Color = Color(red: 71/255, green: 198/255, blue: 255/255)
    static let circleRoundEnd: Color = Color(red: 90/255, green: 131/255, blue: 255/255)
}

struct ThreeDots: View {
    
    @State var isAnimating = false
    @State var circleStart: CGFloat = 0.17
    @State var circleEnd: CGFloat = 0.325
    @State var rotationDegree: Angle = .degrees(0)
    
    let trackerRotation: Double =  2
    let animationDuration: Double = 0.75
    
    let circleTrackGradient = LinearGradient(colors: [Color.circleTrackStart, Color.circleTrackEnd], startPoint:
            .top, endPoint: .bottom)
    let circleFillGradient = LinearGradient(colors: [Color.circleRoundStart, Color.circleRoundEnd], startPoint:
            .topLeading, endPoint: .trailing)
    
    // MARK: - Views
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(circleTrackGradient)
                    .shadow(color: .label.opacity (0.015), radius: 5, x: 1, y: 1)
                Circle()
                    .trim(from: circleStart, to: circleEnd)
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .fill(circleFillGradient)
                    .rotationEffect(rotationDegree)
            }
            .frame (width: 250, height: 250)
            .onAppear() {
                animateLoader()
                Timer.scheduledTimer(withTimeInterval: (trackerRotation * animationDuration) + animationDuration,
                                     repeats:true) { loadingTImer in
                    self.animateLoader()
                }
            }
        }
    }
    
    // MARK: - Functions
    func getRotationAngle() -> Angle {
        return .degrees(360 * trackerRotation) + .degrees(120)
    }
    
    func animateLoader() {
        withAnimation(.spring(response: animationDuration * 2)) {
            rotationDegree = .degrees(-57.5)
            circleEnd = 0.325
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
            withAnimation(.easeInOut(duration: trackerRotation * animationDuration)) {
                self.rotationDegree += self.getRotationAngle()
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration * 1.25, repeats: false) { _ in
            withAnimation(.easeInOut(duration: (trackerRotation * animationDuration) / 2.25)) {
                circleEnd = 0.95
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: trackerRotation * animationDuration, repeats: false) { _ in
            rotationDegree = .degrees(47.5)
            withAnimation(.easeOut(duration: animationDuration)) {
                circleEnd = 0.25
            }
        }
        
    }

}
