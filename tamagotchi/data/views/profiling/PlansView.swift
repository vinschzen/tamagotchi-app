//
//  PlansView.swift
//  tamagotchi
//
//  Created by MacBook Air on 25/09/24.
//

import SwiftUI

struct PlansView: View {
    @State var plans: Set<String> = []
    @Environment(\.modelContext) private var context

    var body: some View {

        NavigationStack{
            VStack(alignment:.leading) {
                
                Text("Here's Your Plan!")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.vertical, 90.0)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                VStack{
                    HStack{
                        Spacer()
                        VStack{
                            ForEach(Array(plans), id: \.self) { plan in
                                Text(plan)
                                Divider()
                            }
                        }
                        .padding(.horizontal, 40)
                        .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .frame(alignment: .center)
                    .listStyle(PlainListStyle())
                    Spacer()
                    
                    Button(action: {
                        Array(plans).forEach { p in
                            var plan = TaskList(
                                title: p,
                                shared: false,
                                tasklist: [
                                    TaskItem(
                                        name: "Item 1",
                                        difficulty: 0,
                                        date: Date(),
                                        time: "00:00",
                                        priority: 1,
                                        finished: false),
                                    TaskItem(
                                        name: "Item 2",
                                        difficulty: 0,
                                        date: Date(),
                                        time: "00:00",
                                        priority: 1,
                                        finished: false),
                                    TaskItem(
                                        name: "Item 3",
                                        difficulty: 0,
                                        date: Date(),
                                        time: "00:00",
                                        priority: 1,
                                        finished: false),
                                ])
                            context.insert(plan)
                            do {
                                try context.save()
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                        
                        
                        
                    }, label: {
                        NavigationLink(destination: FinalizePlanView()){
                            Text("Next")
                                .buttonStyle(.borderedProminent)
                                .font(.system(size: 25, weight: .bold))
                        }
                        
                    })
                    Spacer()
                }
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    PlansView()
}
