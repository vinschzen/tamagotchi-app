import SwiftUI

struct AddFriendsView: View {
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
        Friend(name: "Dani Setiawan", avatar: "rabbit", level: 18),
    ]
    
    @State private var searchText = ""
    @State private var showAlert = false
    @State private var selectedFriend: Friend?
    @State private var pendingRequests: [UUID: Bool] = [:]
    
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
                        .background(Color.beige)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.teal, lineWidth: 1.5))
                        .contentShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(friend.name)
                            .font(.headline)
                        
                        Text("Level " + String(friend.level))
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    
                    if pendingRequests[friend.id] == true {
                        HStack {
                            Image(systemName: "hourglass")
                            Text("Pending")
                        }
                        .padding(.horizontal)
                        .foregroundColor(.orange)
                    } else {
                        Button(action: {
                            selectedFriend = friend
                            showAlert = true
                        }) {
                            Image(systemName: "plus")
                                .padding(.horizontal)
                                .foregroundColor(.navy)
                                .fontWeight(.bold)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Send Request"),
                                message: Text("Do you want to send a request to \(selectedFriend?.name ?? "this user")?"),
                                primaryButton: .default(Text("Send")) {
                                    if let friendToUpdate = selectedFriend {
                                        pendingRequests[friendToUpdate.id] = true // Update status to pending
                                    }
                                },
                                secondaryButton: .cancel()
                            )
                        }
                    }
                }
                .padding(.vertical, 8)
                .background(
                    NavigationLink("", destination: VisitProfileView(friend: friend))
                        .opacity(0)
                )
            }
            .listStyle(PlainListStyle())
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Add Friends")
        .tabViewStyle(.automatic)
    }
}

#Preview {
    NavigationStack {
        AddFriendsView()
    }
}
