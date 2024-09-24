import SwiftUI

struct TaskListCreateView: View {
    @State private var selectedTab = 0
    @State private var isEditingTitle = false
    @State private var tasklist_title = ""
        
    @State private var task_title = ""

    @State private var selectedIndex: Int = 0
    @State private var isOn = false
    
    @State private var isPopoverOpen = false
    
    var priorities = ["Low", "Medium", "High"]
    @State private var selectedPriority: String = "High"
    
    @State private var date = Date()
    @State private var time = "00:00"
    
    @State private var addedTasks = [TaskItem]()
    
    @State private var showAlert = false
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Toggle(isOn: $isOn) {
                        Text("Public Tasklist")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.horizontal)

                HStack {
                    TextField("Enter title", text: $tasklist_title)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .opacity(isEditingTitle ? 1 : 0.5)
                        .onTapGesture {
                            isEditingTitle.toggle()
                        }
                }
                .padding(.horizontal)
                

                List {
                    TaskItemView(addedTasks: addedTasks)
                    
                    Button(action: {
                        isPopoverOpen.toggle()
                    }) {
                        Text("Add Task")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color(red: 239.0, green: 239.0, blue: 239.0))
                            .cornerRadius(10)
                    }
                    .popover(isPresented: $isPopoverOpen) {
                        VStack {
                            
                            Text("Add Task")
                                .font(.system(size: 28))

                            HStack {
                                TextField("Enter task name", text: $task_title)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal)
                                    .opacity(isEditingTitle ? 1 : 0.5)
                                    .onTapGesture {
                                        isEditingTitle.toggle()
                                    }
                            }
                            .padding(.horizontal)
                            
                            DatePicker(
                                "Start Date",
                                selection: $date,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .datePickerStyle(.graphical)
                            .onChange(of: date) { newValue in
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "yyyy-MM-dd"
                                let dateString = dateFormatter.string(from: newValue)

                                let timeFormatter = DateFormatter()
                                timeFormatter.dateFormat = "HH:mm"
                                let timeString = timeFormatter.string(from: newValue)
                            }
                            .padding(.horizontal)

                            Picker("Priority", selection: $selectedPriority) {
                                ForEach(priorities, id: \.self) { priority in
                                    Text(priority)
                                }
                            }
                            
                            Button(action: {
                                guard !task_title.isEmpty else {
                                    showAlert = true
                                    return
                                }
                                
                                var input_priority = 0

                                switch selectedPriority {
                                case "Low":
                                    input_priority = 0
                                case "Medium":
                                    input_priority = 1
                                case "High":
                                    input_priority = 2
                                default:
                                    input_priority = 0
                                }
                                addedTasks.append(
                                    TaskItem(
                                             name:task_title,
                                             difficulty: 0,
                                             date: date,
                                             time: time,
                                             priority: input_priority,
                                             finished: false
                                            )
                                )
                                
                                isPopoverOpen = false
                                dump(addedTasks)
                            }) {
                                
                                Text("Add Task")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .padding()
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text("Empty Task Title"), message: Text("Please enter a title for your task."))
                            }
                        }
                        
                    }
                }
                
                Button(action: {
                    let tasklist = TaskList(
                        title: tasklist_title,
                        shared: false,
                        tasklist: addedTasks
                    )
                    context.insert(tasklist)
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
//                    tasklist_title = ""
                    dismiss()
                    
                })
                {
                    Text("Finish List")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
                
            }
            
        }
        .tabViewStyle(.automatic)
//        .bottomSheet(isPresented: $showBottomSheet) {
//            BottomSheetContent()
//        }
    }
}
