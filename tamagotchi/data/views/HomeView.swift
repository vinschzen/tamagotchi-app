import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var selectedTab = 0
    @State private var isEditingTitle = false
    @State private var title = ""
    
    @State private var selectedIndex: Int = 0
    
    @Environment(\.modelContext) var modelContext
    @State private var user: User?
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                PetMainView()
                    .tabItem {
                        Text("Pet Name")
                        Image(systemName: "pawprint.fill")
                            .renderingMode(.template)
                    }
                    .tag(0)
                
                TaskListHomeView()
                    .tabItem {
                        Label("To Do List", systemImage: "checklist")
                    }
                    .tag(1)
                
                FriendsMainView()
                    .tabItem {
                        Text("Friendlist")
                        Image(systemName: "person.2")
                    }
                    .badge("12")
                    .tag(2)
            }
            .onAppear(perform: load)
        }
        
    }
    
    
    
    func load() {
        let request = FetchDescriptor<User>()
        let data = try? modelContext.fetch(request)
        user = data?.first ?? User(name: "User", level: 10.0, money: 300)
    }
}
