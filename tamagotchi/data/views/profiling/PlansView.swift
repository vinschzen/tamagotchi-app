//
//  PlansView.swift
//  tamagotchi
//
//  Created by MacBook Air on 25/09/24.
//

import SwiftUI

struct PlansView: View {
    @State var plans: Set<String> = []
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
