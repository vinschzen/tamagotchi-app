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
    
    

    @Environment(\.modelContext) private var context
    @Query private var tasklists: [TaskList]

    @State private var isSectionExpanded: [Bool] = Array(repeating: false, count: 50)

    var body: some View {
        NavigationSplitView {
            List {
//                CollapsibleList(tasklists: tasklists)
                ForEach(0..<tasklists.count, id: \.self) { sectionIndex in
                    DisclosureGroup(
                        tasklists[sectionIndex].title,
                        isExpanded: $isSectionExpanded[sectionIndex]
                    ) {
                        ForEach(tasklists[sectionIndex].tasklist) { t in
                            HStack {
                                Image(systemName: t.finished
                                      ? "largecircle.fill.circle"
                                      : "circle"
                                )
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                                .onTapGesture {
                                    t.finished.toggle()
                                }
                                Text(t.name)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .frame(width: 300)
                }
            }
            .navigationBarTitle("Task List", displayMode: .inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: TaskListCreateView()) {
    
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
    
                    }.navigationBarTitle("Create Task", displayMode: .inline)
                }
                ToolbarItem {
                    Button(action: filter) {
                        Label("Filter", systemImage: "magnifyingglass")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
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
    
    private func details(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                TaskListDetailsView(tasklist: tasklists[index])
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
