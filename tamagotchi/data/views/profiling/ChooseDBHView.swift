//
//  ChooseDBHView.swift
//  tamagotchi
//
//  Created by MacBook Air on 23/09/24.
//

import SwiftUI

struct ChooseDBHView: View {
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
                            Text("Run 1 Miles 🏃‍♂️")
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
                            Text("Drink Water 💧")
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
                            Text("Breakfast 🥣")
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
                        Button(action: {
                            
                        }, label:{
                            Text("Go To Gym 💪")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                            // 1
                                .foregroundColor(.white)
                            
                            // 2
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 16,
                                        style: .continuous
                                    )
                                    .fill(.gray)
)
                            Spacer()
                        })
                    }
                    .padding([.leading, .bottom, .trailing], 15.0)
                    HStack{
                        Button(action: {
                            
                        }, label:{
                            Text("Eat Fruit 🍉")
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
                            Text("Sleep Early 🛌")
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
                            Text("Cooking Food  🍳")
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
                            Text("Yoga 🧘🏻")
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
                            Text("Digital Detox 📱")
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
    ChooseDBHView()
}
