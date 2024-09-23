import SwiftUI

struct RequestFriendsView: View {
    
    @State private var friends = [
        Friend(name: "Budiono Siregar", avatar: "Fox", level: 25),
        Friend(name: "Andre Onderdil", avatar: "rabbit", level: 10),
        Friend(name: "Wahyu Kopling", avatar: "Fox", level: 14),
        Friend(name: "Ambatukam", avatar: "rabbit", level: 37),
        Friend(name: "Mas Rusdi", avatar: "Fox", level: 26),
        Friend(name: "Farhan Kebab", avatar: "rabbit", level: 9),
        Friend(name: "Bapack Rehan", avatar: "Fox", level: 31),
        Friend(name: "Ahmad Bekasi", avatar: "Fox", level: 19),
        Friend(name: "Siti Tahu Bakso", avatar: "rabbit", level: 45),
        Friend(name: "Dewi Lestari", avatar: "Fox", level: 8),
        Friend(name: "Hasan Keseimbangan", avatar: "Fox", level: 22),
        Friend(name: "Fauzan Raden", avatar: "rabbit", level: 33),
        Friend(name: "Bambang Widi", avatar: "Fox", level: 17),
        Friend(name: "Novi Pangestu", avatar: "Fox", level: 29),
        Friend(name: "Ayu Cempaka", avatar: "rabbit", level: 15),
        Friend(name: "Rio Satria", avatar: "Fox", level: 27),
        Friend(name: "Agus Santoso", avatar: "Fox", level: 12),
        Friend(name: "Johanes Siskampling", avatar: "rabbit", level: 18),
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

