import SwiftUI

struct OtherView: View {
        
    @State var isPresented: Bool = false

    var body: some View {
        VStack {
            Button {
                isPresented.toggle()
                    } label: {
                        Label("View in AR", systemImage: "arkit")
                    }.buttonStyle(BorderedProminentButtonStyle())
                .padding(24)
        }
        .padding()
        .fullScreenCover(isPresented: $isPresented, content: {
           SheetView(isPresented: $isPresented)
        })
        
    }
}
