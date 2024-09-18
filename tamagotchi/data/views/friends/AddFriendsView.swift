import SwiftUI

struct AddFriendsView: View {
    let friends = [
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
                            
                            Text("Level " + String(friend.level))
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Image(systemName: "plus")
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            }
    
        }
        .navigationBarTitleDisplayMode(.automatic)
        .navigationTitle("Add Friends")
        .tabViewStyle(.automatic)
    }
}

#Preview {
    AddFriendsView()
}