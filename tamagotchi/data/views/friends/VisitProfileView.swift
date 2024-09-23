//
//  VisitProfileView.swift
//  tamagotchi
//
//  Created by MacBook Pro on 21/09/24.
//

import SwiftUI

struct VisitProfileView: View {
    var friend: Friend
    @State var pet : String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(friend.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 30)
            
            Image(pet)
                .resizable()
                .scaledToFit()
                .frame(width: 400, alignment: .center)
                .onAppear(perform: timerPet)
            
            ProgressView(value: Float(friend.level) / 100)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.orange))
                .frame(width: 200)
                .padding(.bottom, 15)
            
            Text("Level \(friend.level)")
                .fontWeight(.semibold)
                .padding(.bottom, 50)
            
            Button(action: {
                // Action for sending a reminder
            }) {
                Text("Add Friend")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .frame(width: 130, height: 55)
            .foregroundColor(.white)
            .background(.navy)
            .cornerRadius(12)
            Spacer()

        }
        .padding(.bottom, 60)
        .navigationTitle("Visit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .tabViewStyle(.automatic)
        .background(
            RadialGradient(gradient: Gradient(colors: [.beige, .white]),
                           center: .center,
                           startRadius: 0,
                           endRadius: 500)
        )
    }
    
    
    func timerPet(){
        
        var index = 1
        var maxIndex = 0
        
        if (friend.avatar == "Fox") {
            maxIndex = 14
        } else if (friend.avatar == "rabbit") {
            maxIndex = 9
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.20, repeats: true) { (Timer) in
            
            pet = "\(friend.avatar)\(index)"
            
            index += 1
            
            if (index > maxIndex) {
                index = 1
            }
        }
    }
}

#Preview {
    NavigationStack {
        VisitProfileView(friend: Friend(name: "Sample Friend", avatar: "Fox", level: 20))
    }
}
