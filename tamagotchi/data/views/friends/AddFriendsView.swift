import SwiftUI

struct AddFriendsView: View {
    @State private var friends = [
        Friend(name: "Omar Danial", avatar: "Fox", level: 26),
        Friend(name: "Putra Pratama", avatar: "rabbit", level: 12),
        Friend(name: "Qori Anwar", avatar: "axolotl", level: 15),
        Friend(name: "Rizky Kurniawan", avatar: "rabbit", level: 39),
        Friend(name: "Sari Indah", avatar: "Fox", level: 28),
        Friend(name: "Toni Wibowo", avatar: "axolotl", level: 11),
        Friend(name: "Ujang Hermawan", avatar: "Fox", level: 33),
        Friend(name: "Vita Sari", avatar: "Fox", level: 21),
        Friend(name: "Winda Sari", avatar: "axolotl", level: 47),
        Friend(name: "Yusuf Hidayat", avatar: "Fox", level: 10),
        Friend(name: "Zulfa Maulida", avatar: "Fox", level: 25),
        Friend(name: "Adi Saputra", avatar: "rabbit", level: 35),
        Friend(name: "Bambang Hartono", avatar: "axolotl", level: 19),
        Friend(name: "Cici Nurhayati", avatar: "Fox", level: 31),
        Friend(name: "Dedi Supriyadi", avatar: "rabbit", level: 17),
        Friend(name: "Eka Pratiwi", avatar: "axolotl", level: 29),
        Friend(name: "Fikri Hidayat", avatar: "Fox", level: 14),
        Friend(name: "Gina Lestari", avatar: "axolotl", level: 20),
        Friend(name: "Hendra Wijaya", avatar: "Fox", level: 27),
        Friend(name: "Ika Sari", avatar: "rabbit", level: 13),
        Friend(name: "Joko Santoso", avatar: "axolotl", level: 16),
        Friend(name: "Kartika Dewi", avatar: "rabbit", level: 40),
        Friend(name: "Linda Permata", avatar: "Fox", level: 29),
        Friend(name: "Maya Kurnia", avatar: "axolotl", level: 12),
        Friend(name: "Nurul Aini", avatar: "Fox", level: 34),
        Friend(name: "Oki Pratama", avatar: "Fox", level: 22),
        Friend(name: "Putri Ayu", avatar: "axolotl", level: 48),
        Friend(name: "Rian Prasetyo", avatar: "Fox", level: 11),
        Friend(name: "Siti Aminah", avatar: "Fox", level: 26),
        Friend(name: "Taufik Hidayat", avatar: "rabbit", level: 36),
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
                            Image(systemName: "paperplane")
                        }
                        .padding(.horizontal)
                        .foregroundColor(.teal)
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
