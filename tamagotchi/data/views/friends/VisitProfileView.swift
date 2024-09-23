import SwiftUI

struct VisitProfileView: View {
    var friend: Friend
    @State private var pet: String = ""
    @State private var toogleAddFriend = false
    @State private var activeAlert: ActiveAlert?

    enum ActiveAlert: Identifiable {
        case sendRequest, cancelRequest

        var id: Int {
            hashValue
        }
    }

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
                if toogleAddFriend {
                    // Prompt to cancel friend request
                    activeAlert = .cancelRequest
                } else {
                    // Prompt to send friend request
                    activeAlert = .sendRequest
                }
            }) {
                Text(toogleAddFriend ? "Request has been sent" : "Add Friend")
                    .fontWeight(.bold)
            }
            .frame(width: 220, height: 55)
            .foregroundColor(.white)
            .background(toogleAddFriend ? Color.teal : Color.navy)
            .cornerRadius(12)
            .buttonStyle(BorderlessButtonStyle())
            .alert(item: $activeAlert) { alert in
                switch alert {
                case .sendRequest:
                    return Alert(
                        title: Text("Send Friend Request"),
                        message: Text("Send a friend request to \(friend.name)?"),
                        primaryButton: .default(Text("Send")) {
                            toogleAddFriend = true
                        },
                        secondaryButton: .cancel()
                    )
                case .cancelRequest:
                    return Alert(
                        title: Text("Cancel Friend Request"),
                        message: Text("Cancel the friend request to \(friend.name)?"),
                        primaryButton: .destructive(Text("Cancel Request")) {
                            toogleAddFriend = false
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
            
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

    func timerPet() {
        var index = 1
        var maxIndex = 0
        
        if friend.avatar == "Fox" {
            maxIndex = 14
        } else if friend.avatar == "rabbit" {
            maxIndex = 9
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.20, repeats: true) { _ in
            pet = "\(friend.avatar)\(index)"
            index += 1
            if index > maxIndex {
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
