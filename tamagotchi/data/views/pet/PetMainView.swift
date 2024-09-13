import SwiftUI

struct PetMainView: View {
    @State private var selectedIndex: Int = 0

    var body: some View {
        NavigationView {
            VStack {
  
            }
            .navigationBarTitle("Pet Screen", displayMode: .inline)
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
