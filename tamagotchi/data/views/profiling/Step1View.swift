//
//  Step1View.swift
//  tamagotchi
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI


struct Step1View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationStack{
            VStack(alignment:.leading) {
                
                Text(" How much \n time are you \n willing to \n spend?")
                    .font(.system(size: 40, weight: .bold))
                    .padding([.top, .leading], 20.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            VStack{
                Text("Tips :")
                    .font(.system(size: 15, weight: .bold))
                Text("Make a specific time to achieve it")
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    
                }, label:{
                    NavigationLink(destination: Step2View()){
                        Text("Weekdays")
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
                    NavigationLink(destination: Step2View()){
                        Text("Weekends")
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
                    NavigationLink(destination: Step2View()){
                        Text("Everyday")
                            .padding()
                            .foregroundColor(.white)
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
            
            Text("Step 1 of 3")
            
        }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

#Preview {
    Step1View()
}
