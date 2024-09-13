//
//  ContentView.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//

import SwiftUI
import SwiftData

struct GetStartedView: View {

    @Environment(\.modelContext) private var modelContext
    @State private var selectedIndex: Int = 0

    var body: some View {
            VStack {
                Text("Get Started")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                Button(action:
                {
                    
                }) {
                    Text("Take Quiz")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)

                }
                
                Button(action:
                {
                    
                }) {
                    Text("Skip")
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)

                }
                
                TabView(selection: $selectedIndex) {
                            NavigationStack() {
                                Text("Home View")
                                    .navigationTitle("Home")
                            }
                            .tabItem {
                                Text("Home view")
                                Image(systemName: "house.fill")
                                    .renderingMode(.template)
                            }
                            .tag(0)
                            
                            NavigationStack() {
                                Text("Profile view")
                                    .navigationTitle("Profile")
                            }
                            .tabItem {
                                Label("Profile", systemImage: "person.fill")
                            }
                            .tag(1)
                            
                            NavigationStack() {
                                Text("About view")
                                    .navigationTitle("About")
                                
                            }
                            .tabItem {
                                Text("About view")
                                Image(systemName: "info.circle")

                            }
                            .badge("12")
                            .tag(2)
                        
                }
            }
            .padding()
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
