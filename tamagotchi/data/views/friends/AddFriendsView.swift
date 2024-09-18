import SwiftUI

struct AddFriendsView: View {
    let friends = [
        Friend(name: "Budiono Siregar", avatar: "fox", level: 25),
        Friend(name: "Andre Onderdil", avatar: "idk", level: 10),
        Friend(name: "Wahyu Kopling", avatar: "duck", level: 14),
        Friend(name: "Ambatukam", avatar: "fox", level: 37),
        Friend(name: "Mas Rusdi", avatar: "duck", level: 26),
        Friend(name: "Farhan Kebab", avatar: "idk", level: 9),
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
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        
                        Text(friend.name)
                            .font(.headline)
                        Spacer()
                        Image(systemName: "plus")
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
                // Add the searchable modifier here
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                
                Spacer()
        
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Add Friends")
        .tabViewStyle(.automatic)
    }
}

#Preview {
    AddFriendsView()
}
