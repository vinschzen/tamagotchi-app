//
//  ContentView.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//

import SwiftUI
import SwiftData

struct LoginView: View {

    @Environment(\.modelContext) private var modelContext

    @State private var username = ""
    @State private var password = ""
    @State private var isRegistering = false

    var body: some View {
            VStack {
                Text(isRegistering ? "Register" : "Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding()


                Button(action:
                {
                    if isRegistering {
                   
                        print("Registering user: \(username)")

//                        let newUser = User(name: , password: password)
//                        modelContext.insert(newUser)
                        
                    } else {
                        print("Logging in user: \(username)")
                    }
                }) {
                    Text(isRegistering ? "Register" : "Login")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                Button(action: {
                    isRegistering.toggle()
                }) {
                    Text(isRegistering ? "Already have an account? Login" : "Don't have an account? Register")
                        .foregroundColor(.gray)

                }
            }
            .padding()
        
    }
}

#Preview {
    LoginView()
        .modelContainer(for: Item.self, inMemory: true)
}
