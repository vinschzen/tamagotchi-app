//
//  ChooseISView.swift
//  tamagotchi
//
//  Created by MacBook Air on 23/09/24.
//

import SwiftUI

struct ChooseISView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading) {
                Text("Choose \nYour Plan!")
                    .font(.system(size: 40, weight: .bold))
                    .padding(/*@START_MENU_TOKEN@*/.all, 30.0/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack{
                    HStack{
                        Button(action: {
                            
                        }, label:{
                            Text("Learn English📖")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                            // 1
                                .foregroundColor(.white)
                            
                            // 2
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 15,
                                        style: .continuous
                                    )
                                    .fill(.gray)
)
                            Spacer()
                        })
                        Button(action: {
                            
                        }, label:{
                            Text("Reflection ✏️")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                            // 1
                                .foregroundColor(.white)
                            
                            // 2
                                .background(
                                    
                                    RoundedRectangle(
                                        cornerRadius: 15,
                                        style: .continuous
                                    )
                                    .fill(.gray))
                        })
                    }
                    .padding([.leading, .bottom, .trailing], 15.0)
                    
                    HStack{
                        Button(action: {
                            
                        }, label:{
                            Text("Do Homework 📃")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                            // 1
                                .foregroundColor(.white)
                            
                            // 2
                                .background(
                                    
                                    RoundedRectangle(
                                        cornerRadius: 15,
                                        style: .continuous
                                    )
                                    .fill(.gray))
                            
                        })
                    }
                    .padding([.leading, .bottom, .trailing], 15.0)
                    HStack{
                        Button(action: {
                            
                        }, label:{
                            Text("Pomodoro Study 📕")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                            // 1
                                .foregroundColor(.white)
                            
                            // 2
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 15,
                                        style: .continuous
                                    )
                                    .fill(.gray)
)
                            Spacer()
                        })
                        Button(action: {
                            
                        }, label:{
                            Text("Break 🌿")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                            // 1
                                .foregroundColor(.white)
                            
                            // 2
                                .background(
                                    
                                    RoundedRectangle(
                                        cornerRadius: 15,
                                        style: .continuous
                                    )
                                    .fill(.gray))
                        })
                    }
                    .padding([.leading, .bottom, .trailing], 15.0)
                    HStack{
                        Button(action: {
                            
                        }, label:{
                            Text("Mind Mapping 🗺️")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                            // 1
                                .foregroundColor(.white)
                            
                            // 2
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 15,
                                        style: .continuous
                                    )
                                    .fill(.gray)
)
                            Spacer()
                        })
                        Button(action: {
                            
                        }, label:{
                            Text("Do Math 🧮")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                            // 1
                                .foregroundColor(.white)
                            
                            // 2
                                .background(
                                    
                                    RoundedRectangle(
                                        cornerRadius: 15,
                                        style: .continuous
                                    )
                                    .fill(.gray))
                        })
                    }
                    .padding([.leading, .bottom, .trailing], 15.0)
                    HStack{
                        
                        Button(action: {
                            
                        }, label:{
                            Text("Group Discussion 👫")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                            // 1
                                .foregroundColor(.white)
                            
                            // 2
                                .background(
                                    
                                    RoundedRectangle(
                                        cornerRadius: 15,
                                        style: .continuous
                                    )
                                    .fill(.gray))
                            
                        })
                                            }
                    .padding([.leading, .bottom, .trailing], 6.0)
                }
                .padding(.horizontal, 8.0)
            }
            .padding()

            Spacer()
            
            Button(action: {
                
            }, label:{
                Text("Plan Now!")
                    
                    .frame(width: 300)
                    .font(.system(size: 25, weight: .bold))
                    .padding(.vertical, 30.0)
                
            })
            
            Spacer()
            Text("Step 3 of 3")
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }
        
    }
}

#Preview {
    ChooseISView()
}
