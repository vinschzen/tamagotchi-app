//
//  chooseTest.swift
//  tamagotchi
//
//  Created by MacBook Air on 23/09/24.
//

import SwiftUI

struct chooseTest: View {
    @State private var selectedPlans: Set<String> = []
    @State var areas: String?
    let plansDBH = [
        "Run 1 Miles 🏃‍♂️",
        "Drink Water 💧",
        "Breakfast 🥣",
        "Go To Gym 💪",
        "Eat Fruit 🍉",
        "Sleep Early 🛌",
        "Yoga 🧘‍♂️",
        "Digital Detox 📵",
        "ror 📵",
    ]
    
    let plansBP = [
        "Check email 📩",
        "Meditation 🧘‍♀️",
        "Reading book 📖",
        "Drawing 🎨",
        "Reasearch 🔍",
        "Journaling 📝",
        "Unlock New Skill 🔓",
        "Meeting 👤",
        "Online Course 📝",
    ]    
    let plansIS = [
        "Learn English📖",
        "Reflection ✏️",
        "Do Homework 📃",
        "Pomodoro Study 📕",
        "Break 🌿",
        "Mind Mapping 🗺️",
        "Do Math 🧮",
        "Group Discussion 👫",
    ]

    var body: some View {
        NavigationStack{
            VStack {
                Text("Choose Your Plan!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40.0)
                
                Spacer()
                
                if (areas == "bp"){
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(0..<plansBP.count, id: \.self) { index in
                            PlanButton(
                                title: plansBP[index],
                                isSelected: selectedPlans.contains(plansBP[index]),
                                toggleSelection: { togglePlan(plansBP[index]) }
                            )
                        }
                    }
                    .padding()
                }
                else if (areas == "dbh"){
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(0..<plansDBH.count, id: \.self) { index in
                            PlanButton(
                                title: plansDBH[index],
                                isSelected: selectedPlans.contains(plansDBH[index]),
                                toggleSelection: { togglePlan(plansDBH[index]) }
                            )
                        }
                    }
                    .padding()
                }
                else if(areas == "is"){
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(0..<plansIS.count, id: \.self) { index in
                            PlanButton(
                                title: plansIS[index],
                                isSelected: selectedPlans.contains(plansIS[index]),
                                toggleSelection: { togglePlan(plansIS[index]) }
                            )
                        }
                    }
                    .padding()
                }

                // 2x2 grid layout
                
                Spacer()

                Button(action: {
                    // Handle "Plan Now!" action
                    print("Selected Plans: \(selectedPlans)")
                }) {
                    NavigationLink(destination: PlansView(plans: selectedPlans)){
                        Text("Plan Now!")
                            .font(.title3)
                            .foregroundColor(.blue)
                    }
                }
                .padding()

                Text("Step 3 of 3")
                    .font(.footnote)
                    .padding(.bottom)
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }

    func togglePlan(_ plan: String) {
        if selectedPlans.contains(plan) {
            selectedPlans.remove(plan)
        } else {
            selectedPlans.insert(plan)
        }
    }
}

struct PlanButton: View {
    let title: String
    let isSelected: Bool
    let toggleSelection: () -> Void

    var body: some View {
        Button(action: {
            toggleSelection()
        }) {
            Text(title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(20)
        }
    }
}

struct chooseTest_Previews: PreviewProvider {
    static var previews: some View {
        chooseTest()
    }
}
