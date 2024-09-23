//
//  GetStartedView2.swift
//  tamagotchi
//
//  Created by MacBook Air on 20/09/24.
//

import SwiftUI

struct GetStartedView2: View {
    let items = [
        ("Hooray! We've been waiting for you!", "photo1"),
        ("Let's Get Started!", "photo2"),
        
    ]
    
    @State private var currentIndex = 0
    @State private var progress: Double = 0.0
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                VStack {
                    // Carousel View
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(0..<items.count, id: \.self) { index in
                                VStack {
                                    Image(items[index].1)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(25)
                                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.6)
                                        .padding(.bottom, 10)
                                    
                                    Text(items[index].0)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                        }
                    }
                    .content.offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.8, alignment: .leading)
                    .animation(.easeInOut, value: currentIndex)
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                if value.translation.width < -50 {
                                    if self.currentIndex < self.items.count - 1 {
                                        self.currentIndex += 1
                                    }
                                }
                                if value.translation.width > 50 {
                                    if self.currentIndex > 0 {
                                        self.currentIndex -= 1
                                    }
                                }
                            }
                    )
                    
                    // Custom Dot Progress Bar
                    DotProgressView(totalSteps: items.count, currentIndex: $currentIndex, progress: $progress)
                        .padding()
                    Button( action: {
                        
                    }){
                        NavigationLink(destination: Step1View()){
                            
                            Text("Login")
                                .frame(width: UIScreen.main.bounds.width*0.8, height: 50, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.blue))
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke())
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }
                    
                    
                    Button(action:
                            {
                        
                    }) {
                        NavigationLink(destination: PetMainView()){
                            Text("Skip")
                                .foregroundColor(.blue)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .onReceive(timer) { _ in
                self.updateProgress()
            }
        }
    }
    
    // Progress and Timer Logic
    private func updateProgress() {
        // Increase the progress value slowly
        if progress < 1.0 {
            progress += 0.02 // adjust this value to control speed
        } else {
            progress = 0.0
            if currentIndex < items.count - 1 {
                currentIndex += 1
            } else {
                currentIndex = 0 // restart carousel if at the end
            }
        }
    }}


#Preview {
    GetStartedView2()
}