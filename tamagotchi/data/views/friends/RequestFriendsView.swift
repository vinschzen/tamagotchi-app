import SwiftUI

struct RequestFriendsView: View {
    @State private var friends = [
        Friend(name: "Budiono Siregar", avatar: "fox", level: 25),
        Friend(name: "Andre Onderdil", avatar: "idk", level: 10),
        Friend(name: "Wahyu Kopling", avatar: "duck", level: 14),
        Friend(name: "Ambatukam", avatar: "fox", level: 37),
        Friend(name: "Mas Rusdi", avatar: "duck", level: 26),
        Friend(name: "Farhan Kebab", avatar: "idk", level: 9),
        Friend(name: "Joko Siang", avatar: "fox", level: 31),
        Friend(name: "Ahmad Bekasi", avatar: "duck", level: 19),
        Friend(name: "Siti Pertiwi", avatar: "idk", level: 45),
        Friend(name: "Dewi Lestari", avatar: "fox", level: 8),
        Friend(name: "Anita Tarigan", avatar: "duck", level: 22),
        Friend(name: "Fauzan Raden", avatar: "idk", level: 33),
        Friend(name: "Bambang Widi", avatar: "fox", level: 17),
        Friend(name: "Novi Pangestu", avatar: "duck", level: 29),
        Friend(name: "Ayu Cempaka", avatar: "idk", level: 15),
        Friend(name: "Rio Satria", avatar: "fox", level: 27),
        Friend(name: "Agus Santoso", avatar: "duck", level: 12),
        Friend(name: "Dani Setiawan", avatar: "idk", level: 18),
    ]
    
    @State private var searchText = ""
    @State private var acceptAlert = false
    @State private var rejectAlert = false
    @State private var selectedFriend: Friend?
    
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
                    Image(friend.avatar)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.green, lineWidth: 2))
                    
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
                            .foregroundColor(.green)
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
                            .foregroundColor(.red)
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
                                        friends.remove(at: index)
                                    }
                                }
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
                .padding(.vertical, 8)
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Request")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.white, for: .navigationBar)
    }
}

#Preview {
    NavigationView{
        RequestFriendsView()
    }
}
