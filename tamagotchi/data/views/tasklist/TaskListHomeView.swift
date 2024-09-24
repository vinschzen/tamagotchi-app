import SwiftUI
import SwiftData

struct TaskListHomeView: View {
    @State private var selectedTab = 0
    @State private var isEditingTitle = false
    @State private var title = ""

    @State private var selectedIndex: Int = 0
    
    
    @State private var isPopoverOpen = false
    
    var filters = ["Today", "Recent", "Oldest"]
    @State private var selectedFilter: String = "Today"

    @State private var isDetailViewShowing = false

    @Environment(\.modelContext) private var context
    
    @Query private var tasklists: [TaskList]
    @State private var isSectionExpanded: [Bool] = Array(repeating: false, count: 50)
    @State private var showConfetti = false


    var body: some View {
        NavigationSplitView {
            List {
                ForEach(tasklists) { l in
                    ProcessRowView(tasklist: l, confettiAction: confetti)
                }
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: TaskListCreateView()) {
    
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
    
                    }.navigationBarTitle("Task List", displayMode: .inline)
                }
                ToolbarItem {
                    NavigationLink(destination: TaskListSharedView()) {
    
                        Button(action: addItem) {
                            Label("Search", systemImage: "magnifyingglass")
                        }
    
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }                
        .displayConfetti(isActive: $showConfetti)
    }
    
    private func addItem() {
        
        withAnimation {
//            let newItem = TaskList(timestamp: Date())
//            context.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                context.delete(tasklists[index])
            }
        }
    }

    func confetti(isTapped: Bool) {
        guard (isTapped) else {return}
        
        withAnimation(.easeInOut(duration: 5)) {
            showConfetti = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(.easeInOut(duration: 5)) {
                showConfetti = false
            }
        }
    }
    
    private func filter() {
        
    }
}


#Preview {
    TaskListHomeView()
        .modelContainer(for: TaskList.self, inMemory: true)
}
