//
//  MeetFriendsView.swift
//  tamagotchi
//
//  Created by MacBook Pro on 18/09/24.
//

import SwiftUI

struct MeetFriendsView: View {
    
    var friend: Friend
    
    var body: some View {
        VStack {
            Spacer()
            Text(friend.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            Image("fox-main")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170)
                .padding(.bottom, 30)
            
            
            
            ProgressView(value: Float(friend.level) / 100)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
                .frame(width: 200)
                .padding(.bottom, 15)
            
            Text("Level \(friend.level)")
                .font(.title3)
                .padding(.bottom, 50)
            
            
            Button(action: {
                // Action for sending a reminder
            }) {
                Image(systemName: "exclamationmark.brakesignal")
                    .frame(width: 100, height: 20)
                    .scaledToFit()
            }
            .padding()
            .foregroundColor(.black)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
            Text("Send Reminder")
                .fontWeight(.semibold)
                .padding(.bottom, 50)
            
            Spacer()
            
        }
        .navigationTitle("Meet Your Friend")
        .navigationBarTitleDisplayMode(.inline)
        .tabViewStyle(.automatic)
    }
}

#Preview {
    NavigationStack {
        MeetFriendsView(friend: Friend(name: "Sample Friend", avatar: "fox", level: 20))
    }
}
