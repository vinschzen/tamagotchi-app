import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var toast: Toast?
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if let toast = toast {
                VStack {
                    Spacer()
                    ToastView(message: toast.message)
                        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                        .animation(.spring(), value: toast)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration) {
                                withAnimation {
                                    self.toast = nil
                                }
                            }
                        }
                }
                .padding(.bottom, 50)
            }
        }
    }
}

extension View {
    func toastView(toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}

struct Toast: Equatable{
    let message: String
    let duration: Double = 2.0
}
