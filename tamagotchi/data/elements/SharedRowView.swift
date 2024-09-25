import SwiftUI

struct SharedRowView: View {
    enum Action {
        case share
    }
    @State private var isActive = false
    @State private var action: Action?
    
    @State private var selectedList:TaskList?
    
    let tasklist: TaskList

    @Environment(\.modelContext) private var context

    var body: some View {
        // by default navigate as-is
        NavigationLink(tasklist.title, destination: destination, isActive: $isActive)
            .swipeActions() {
                Button("Add") {
                    context.insert(tasklist)
                            
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    action = .share    // specific action
                    selectedList = tasklist
                    isActive = true   // activate link programmatically
                }.tint(.yellow)
            }
            .onChange(of: isActive) {
                if !$0 {
                    action = nil  // reset back
                }
            }
        
        ForEach(tasklist.tasklist!) { t in
            HStack {
                Image(systemName: t.finished
                      ? "largecircle.fill.circle"
                      : "circle"
                )
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    guard !t.finished else {return}
                    t.finished = true
                }
                Text(t.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    
    }

    @ViewBuilder
    private var destination: some View {
        // construct destination depending on action
        if case .share = action {
//            Text("ProcessView")
//            TaskListDetailsView(tasklist: selectedList!)
            TaskListHomeView()
        } 
    }
}
