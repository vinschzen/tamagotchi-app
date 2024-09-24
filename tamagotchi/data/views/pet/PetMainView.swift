import SwiftUI

struct PetMainView: View {
    @State private var selectedIndex: Int = 0

    var body: some View {
            VStack {
  
            }
            .navigationBarTitle("Pet Screen", displayMode: .inline)
            .toolbar {
            }
        .tabViewStyle(.automatic)
    }
}

#Preview{
    PetMainView()
}
