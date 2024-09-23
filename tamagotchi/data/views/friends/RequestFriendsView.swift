import SwiftUI

struct RequestFriendsView: View {
    
    @State private var friends = [
        Friend(name: "Vina Kurnia", avatar: "axolotl", level: 23),
        Friend(name: "Wawan Setiawan", avatar: "rabbit", level: 11),
        Friend(name: "Yanto Wijaya", avatar: "Fox", level: 27),
        Friend(name: "Zahra Maulida", avatar: "axolotl", level: 10),
        Friend(name: "Andi Prasetyo", avatar: "Fox", level: 32),
        Friend(name: "Bella Anggraini", avatar: "Fox", level: 20),
        Friend(name: "Cahyo Saputro", avatar: "axolotl", level: 46),
        Friend(name: "Dian Lestari", avatar: "Fox", level: 9),
        Friend(name: "Edi Purwanto", avatar: "Fox", level: 24),
        Friend(name: "Farah Putri", avatar: "rabbit", level: 34),
        Friend(name: "Gilang Ramadhan", avatar: "axolotl", level: 18),
        Friend(name: "Hanafi", avatar: "Fox", level: 30),
        Friend(name: "Intan Permatasari", avatar: "rabbit", level: 16),
        Friend(name: "Junaedi", avatar: "axolotl", level: 28),
        Friend(name: "Kiki Amelia", avatar: "Fox", level: 13),
        Friend(name: "Lia Kusuma", avatar: "axolotl", level: 19),
        Friend(name: "Maria Ulfah", avatar: "Fox", level: 22),
        Friend(name: "Novi Andriani", avatar: "axolotl", level: 17),    
    ]
    
    @State private var searchText = ""
    @State private var acceptAlert = false
    @State private var rejectAlert = false
    @State private var selectedFriend: Friend?
    @State private var toast: Toast? = nil
    
    var filteredFriends: [Friend] {
        if searchText.isEmpty {
            return friends
        } else {
            return friends.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        VStack {
            List(filteredFriends) { friend in
                HStack {
                    Image("\(friend.avatar)1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .background(.beige)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.teal, lineWidth: 1.5))
                        .contentShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(friend.name)
                            .font(.headline)
                        
                        Text("Level \(friend.level)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    
                    // Accept Button
                    Button(action: {
                        selectedFriend = friend
                        acceptAlert = true
                    }) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.teal)
                            .padding(4)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    .alert(isPresented: $acceptAlert) {
                        Alert(
                            title: Text("Accept Friend Request"),
                            message: Text("Do you want to accept the friend request from \(selectedFriend?.name ?? "this user")?"),
                            primaryButton: .default(Text("Accept")) {
                                if let friendToRemove = selectedFriend {
                                    if let index = friends.firstIndex(where: { $0.id == friendToRemove.id }) {
                                        self.toast = Toast(message: "\(friendToRemove.name) Accepted!")
                                        friends.remove(at: index)
                                    }
                                }
                            },
                            secondaryButton: .cancel()
                        )
                    }
                    
                    // Reject Button
                    Button(action: {
                        selectedFriend = friend
                        rejectAlert = true
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.navy)
                            .padding(4)
                        
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .alert(isPresented: $rejectAlert) {
                        Alert(
                            title: Text("Reject Friend Request"),
                            message: Text("Do you want to reject the friend request from \(selectedFriend?.name ?? "this user")?"),
                            primaryButton: .destructive(Text("Reject")) {
                                if let friendToRemove = selectedFriend {
                                    if let index = friends.firstIndex(where: { $0.id == friendToRemove.id }) {
                                        self.toast = Toast(message: "\(friendToRemove.name) Rejected!")
                                        friends.remove(at: index)
                                    }
                                }
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
                .padding(.vertical, 8)
                .background(
                    NavigationLink("", destination: VisitProfileView(friend: friend))
                        .opacity(0)
                )
            }
            .listStyle(PlainListStyle())
        }
        .toastView(toast: $toast)
        .navigationTitle("Request")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView{
        RequestFriendsView()
    }
}

