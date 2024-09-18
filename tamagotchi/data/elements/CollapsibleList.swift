import SwiftUI

struct CollapsibleList: View {
    @Environment(\.modelContext) private var context

    @State private var isSectionExpanded: [Bool] = Array(repeating: false, count: 50)
    @State var tasklists: [TaskList]

    var body: some View {
        
        ForEach(0..<tasklists.count, id: \.self) { sectionIndex in
            DisclosureGroup(
                tasklists[sectionIndex].title,
                isExpanded: $isSectionExpanded[sectionIndex]
            ) {
                CollapsibleListChildren(tasklist: tasklists[sectionIndex].tasklist)

            }
            .frame(width: 300)
        }                
        .onDelete(perform: deleteItems)

    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                context.delete(tasklists[index])
            }
        }
    }
    
    
    
}
