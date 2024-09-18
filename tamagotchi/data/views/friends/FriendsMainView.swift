import SwiftUI

struct Friend: Identifiable {
    let id = UUID()
    let name: String
    let avatar: String
}

struct FriendsMainView: View {
    
    let friends = [
        Friend(name: "Budiono Siregar", avatar: "fox"),
        Friend(name: "Andre Onderdil", avatar: "idk"),
        Friend(name: "Wahyu Kopling", avatar: "duck"),
        Friend(name: "Ambatukam", avatar: "fox"),
        Friend(name: "Mas Rusdi", avatar: "duck"),
        Friend(name: "Farhan Kebab", avatar: "idk"),
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
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
                // Add the searchable modifier here
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                
                Spacer()
                
                HStack {
                    Spacer()
                    // Add Friend Button
                    Button(action: {
                        // Handle the add friend action
                    }) {
                        HStack {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                            Text("Add Friend")
                                .foregroundColor(.white)
                                .bold()
                        }
                        .padding()
                        .frame(height: 35)
                        .background(Color.blue)
                        .cornerRadius(20)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Friend List")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tabViewStyle(.automatic)
    }
}

#Preview {
    FriendsMainView()
}
