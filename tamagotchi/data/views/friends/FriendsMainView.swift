import SwiftUI

struct FriendsMainView: View {
    
    let friends = [
        Friend(name: "Agus Santoso", avatar: "Fox", level: 25),
        Friend(name: "Budi Hartono", avatar: "rabbit", level: 10),
        Friend(name: "Citra Dewi", avatar: "axolotl", level: 14),
        Friend(name: "Dewi Lestari", avatar: "rabbit", level: 37),
        Friend(name: "Eka Putri", avatar: "Fox", level: 26),
        Friend(name: "Fajar Nugroho", avatar: "axolotl", level: 9),
        Friend(name: "Gita Pratiwi", avatar: "Fox", level: 31),
        Friend(name: "Hariyanto", avatar: "Fox", level: 19),
        Friend(name: "Indah Permatasari", avatar: "axolotl", level: 45),
        Friend(name: "Joko Susilo", avatar: "Fox", level: 8),
        Friend(name: "Kartika Sari", avatar: "Fox", level: 22),
        Friend(name: "Lukman Hakim", avatar: "rabbit", level: 33),
        Friend(name: "Maya Sari", avatar: "axolotl", level: 17),
        Friend(name: "Nur Hidayat", avatar: "Fox", level: 29),
        Friend(name: "Oki Setiawan", avatar: "rabbit", level: 15),
        Friend(name: "Putri Ayu", avatar: "axolotl", level: 27),
        Friend(name: "Rahmat Hidayat", avatar: "Fox", level: 12),
        Friend(name: "Siti Aminah", avatar: "axolotl", level: 18),
        Friend(name: "Tono Supriyadi", avatar: "Fox", level: 21),
        Friend(name: "Umi Kalsum", avatar: "rabbit", level: 16),
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
                .searchable(text: $searchText)
                
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
