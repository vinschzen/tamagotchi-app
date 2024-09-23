//
//  Step2View.swift
//  tamagotchi
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct Step2View: View {
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading) {
                
                Text("What areas \n important \n to you?")
                    .font(.system(size: 40, weight: .bold))
                    .padding([.top, .leading], 20.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
            }
            VStack{
                Text("Tips :")
                    .font(.system(size: 15, weight: .bold))
                Text("If everything is priority nothing is priority, choose what’s the most important")
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    
                }, label:{
                    NavigationLink(destination: ChooseBPView()){
                        Text("Boost Productivity")
                            .padding()
                        // 1
                            .foregroundColor(.white)
                        
                        // 2
                            .background(
                                
                                RoundedRectangle(
                                    cornerRadius: 15,
                                    style: .continuous
                                )
                                .fill(.maincolor)
                                .frame(width: 250)
                            )
                    }
                }).padding(.top)
                
                Button(action: {
                    
                }, label:{
                    NavigationLink(destination: ChooseDBHView()){
                        Text("Detox Bad Habits")
                            .padding()
                        // 1
                            .foregroundColor(.white)
                        
                        // 2
                            .background(
                                
                                RoundedRectangle(
                                    cornerRadius: 15,
                                    style: .continuous
                                )
                                .fill(.maincolor)
                                .frame(width: 250)
                                //
                            )                        
                    }
                }).padding(.top)
                
                Button(action: {
                    
                }, label:{
                    NavigationLink(destination: ChooseISView()){
                        Text("Improve Study")
                            .padding()
                        // 1
                            .foregroundColor(.white)
                        
                        // 2
                            .background(
                                
                                RoundedRectangle(
                                    cornerRadius: 15,
                                    style: .continuous
                                )
                                .fill(.maincolor)
                                .frame(width: 250)
                            )
                    }
                }).padding(.top)
            }.padding()

                Spacer()
                
                Text("Step 2 of 3")
        }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

#Preview {
    Step2View()
}
