import SwiftUI

struct TaskListHomeView: View {
    @State private var selectedTab = 0
    @State private var isEditingTitle = false
    @State private var title = ""

    @State private var selectedIndex: Int = 0
    
    
    @State private var isPopoverOpen = false
    
    var filters = ["Today", "Recent", "Oldest"]
    @State private var selectedFilter: String = "Today"


    var body: some View {
        NavigationView {
            VStack {
     

                List {
//                    ForEach(toDoItems) { item in
//                        // Display to-do item content
//                    }
                }
                
                NavigationLink(destination: TaskListCreateView()) {
                
                        Text("New List")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    
                }.navigationBarTitle("Create Task", displayMode: .inline)

                
            }
            .navigationBarTitle("Task List", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Handle left button action in navigation bar
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    
//                    Button(action: {
//                        isPopoverOpen.toggle()
//                    }) {
//                        HStack {
//                            Image(systemName: "magnifyingglass")
//                                .foregroundColor(.blue)
//                            Text("Options")
//                        }
//                    }
//                    .popover(isPresented: $isPopoverOpen) {
//                        Picker("Filter by", selection: $selectedFilter) {
//                            ForEach(filters, id: \.self) { filter in
//                                Text(filter)
//                            }
//                        }
//                    }
//                    
                    Button(action: {
                        // Handle right button action in navigation bar
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                    }
                }
            }
            
        }
        .tabViewStyle(.automatic)
//        .bottomSheet(isPresented: $showBottomSheet) {
//            BottomSheetContent()
//        }
    }
}
