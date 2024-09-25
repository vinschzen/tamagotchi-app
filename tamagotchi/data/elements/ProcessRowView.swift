import SwiftUI

struct ProcessRowView: View {
    enum Action {
        case edit
    }
    @State private var isActive = false
    @State private var action: Action?
    
    @State private var selectedList:TaskList?
    
    let tasklist: TaskList
    let confettiAction: (Bool) -> Void
    let notifyAction: (TaskItem) -> Void

    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        // by default navigate as-is
        NavigationLink(tasklist.title, destination: destination, isActive: $isActive)
            .swipeActions() {
                Button("Delete") {
                    withAnimation {
                        context.delete(tasklist)
                    }
                }.tint(.red)
                Button("Edit") {
                    action = .edit    // specific action
                    selectedList = tasklist
                    isActive = true   // activate link programmatically
                }.tint(.blue)
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
                    confettiAction(true)
                    notifyAction(t)
                    
                }
                Text(t.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    
    }

    @ViewBuilder
    private var destination: some View {
        // construct destination depending on action
        if case .edit = action {
//            Text("ProcessView")
            TaskListDetailsView(tasklist: selectedList!)
        } 
    }
}
