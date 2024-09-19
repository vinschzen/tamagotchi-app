import SwiftUI

struct Friend: Identifiable {
    let id = UUID()
    let name: String
    let avatar: String
    let level: Int
}

struct FriendsMainView: View {
    
    let friends = [
        Friend(name: "Budiono Siregar", avatar: "fox-main", level: 25),
        Friend(name: "Andre Onderdil", avatar: "idk", level: 10),
        Friend(name: "Wahyu Kopling", avatar: "duck", level: 14),
        Friend(name: "Ambatukam", avatar: "fox", level: 37),
        Friend(name: "Mas Rusdi", avatar: "duck", level: 26),
        Friend(name: "Farhan Kebab", avatar: "idk", level: 9),
        Friend(name: "Joko Kemalaman", avatar: "fox", level: 31),
        Friend(name: "Ahmad Bekasi", avatar: "duck", level: 19),
        Friend(name: "Siti Tahu Bakso", avatar: "idk", level: 45),
        Friend(name: "Dewi Lestari", avatar: "fox", level: 8),
        Friend(name: "Hasan Keseimbangan", avatar: "duck", level: 22),
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
        NavigationStack {
            ZStack {
                List(filteredFriends) { friend in
                    HStack {
                        NavigationLink(destination: MeetFriendsView(friend: friend)) {
                            Image(friend.avatar)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
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
                        }
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                
                VStack {
                    Spacer()
                    NavigationLink(destination: AddFriendsView()) {
                        Spacer()
                        ZStack {
                            Circle()
                                .frame(height: 55)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 30)
                                .foregroundColor(.green)
                            
                            Image(systemName: "plus")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                        }
                        
                    }
                }
            }
            .navigationTitle("Friends")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink(destination: RequestFriendsView()) {
                    Image(systemName: "person.badge.clock.fill")
                        .foregroundColor(.green)
                }
            }
        }
        .tabViewStyle(.automatic)
    }
}

#Preview {
    FriendsMainView()
}
