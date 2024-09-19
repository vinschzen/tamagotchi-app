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
        NavigationView {
            VStack {
                List(filteredFriends) { friend in
                    HStack {
                        Image(friend.avatar)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.green, lineWidth: 1))
                        
                        VStack(alignment: .leading) {
                            Text(friend.name)
                                .font(.headline)
                            
                            Text("Level \(friend.level)")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                        // Accept Button --------------------
                        Button(action: {
                            selectedFriend = friend
                            acceptAlert = true
                        }) {
                            Image(systemName: "checkmark")
                                .padding(.horizontal, 15)
                        }
                        .alert(isPresented: $acceptAlert) {
                            Alert(
                                title: Text("Terima Permintaan Pertemanan"),
                                message: Text("Apakah Anda ingin menerima permintaan pertemanan dari \(selectedFriend?.name ?? "pengguna ini")?"),
                                primaryButton: .default(Text("Terima")) {
                                    if let friendToRemove = selectedFriend {
                                        // Remove friend from the request list
                                        if let index = friends.firstIndex(where: { $0.id == friendToRemove.id }) {
                                            friends.remove(at: index)
                                        }
                                        // Optionally, add friend to your main friends list
                                    }
                                },
                                secondaryButton: .cancel()
                            )
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                        // Reject Button ----------------
                        Button(action: {
                            selectedFriend = friend
                            rejectAlert = true
                        }) {
                            Image(systemName: "xmark")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .alert(isPresented: $rejectAlert) {
                            Alert(
                                title: Text("Tolak Permintaan Pertemanan"),
                                message: Text("Apakah Anda ingin menolak permintaan pertemanan dari \(selectedFriend?.name ?? "pengguna ini")?"),
                                primaryButton: .destructive(Text("Tolak")) {
                                    if let friendToRemove = selectedFriend {
                                        // Remove friend from the request list
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
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            }
            
        }.navigationBarTitle("Request")
            .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    RequestFriendsView()
}
