import SwiftUI

struct FriendsMainView: View {
    
    let friends = [
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
                                .foregroundColor(.navy)
                            
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
                        .foregroundColor(.navy)
                }
            }
        }
        .tabViewStyle(.automatic)
    }
}

#Preview {
    FriendsMainView()
}
