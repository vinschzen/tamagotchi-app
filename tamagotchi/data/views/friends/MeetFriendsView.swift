import SwiftUI

struct MeetFriendsView: View {
    
    var friend: Friend
    @State var Rabbit : String = ""
    
    
    var body: some View {
        VStack {
            Spacer()
            Text(friend.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            Image(Rabbit)
                .resizable()
                .scaledToFit()
                .frame(width: 400, alignment: .center)
                .onAppear(perform: timerRabbit)
            
            
            ProgressView(value: Float(friend.level) / 100)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
                .frame(width: 200)
                .padding(.bottom, 15)
            
            Text("Level \(friend.level)")
                .fontWeight(.semibold)
                .padding(.bottom, 50)
            
            
            Button(action: {
                // Action for sending a reminder
            }) {
                Image(systemName: "exclamationmark.brakesignal")
                    .frame(width: 100, height: 20)
                    .scaledToFit()
            }
            .padding()
            .foregroundColor(.black)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
            Text("Send Reminder")
                .fontWeight(.semibold)
                .padding(.bottom, 50)
            
            Spacer()
            
        }
        .navigationTitle("Meet Your Friend")
        .navigationBarTitleDisplayMode(.inline)
        .tabViewStyle(.automatic)
    }
    
    
    func timerRabbit(){
        
        var index = 1
        _ = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { (Timer) in
            
            Rabbit = "\(friend.avatar)\(index)"
            
            index += 1
            
            if (index > 9){
                index = 1
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        MeetFriendsView(friend: Friend(name: "Sample Friend", avatar: "Fox", level: 20))
    }
}
