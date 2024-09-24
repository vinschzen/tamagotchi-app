//
//  ContentView.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//

import SwiftUI
import SwiftData

struct GetStartedView: View {
    let items = [
        ("RRAAAHHHH", "photo1"),
        ("Let's Get Started!", "photo2"),
        
    ]
    
    @State private var currentIndex = 0
    @State private var progress: Double = 0.0

    @Environment(\.modelContext) private var modelContext

    @State private var selectedIndex: Int = 0

    var body: some View {
        NavigationStack{
            VStack {
                
                Text("Let's Get Started")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                
                Image("getStarted")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                    Button(action:
                            {
                        
                    }) {
                        
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
            .padding()
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    GetStartedView()
        .modelContainer(for: Item.self, inMemory: true)
}
