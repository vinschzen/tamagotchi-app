import SwiftUI

struct ToastView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .background(.teal)
            .cornerRadius(12)
            .shadow(radius: 10)
            .padding()
    }
}
