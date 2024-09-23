import SwiftUI

struct MeetFriendsView: View {
    
    var friend: Friend
    @State var pet : String = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text(friend.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 30)
            
            Image(pet)
                .resizable()
                .scaledToFit()
                .frame(width: 400, alignment: .center)
                .onAppear(perform: timerPet)
            
            ProgressView(value: Float(friend.level) / 100)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.orange))
                .frame(width: 200)
                .padding(.bottom, 15)
            
            Text("Level \(friend.level)")
                .fontWeight(.semibold)
                .padding(.bottom, 50)
            Button(action: {
                // Action for sending a reminder
            }) {
                Image(systemName: "exclamationmark.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .scaledToFit()
            }
            .padding()
            .frame(width: 130, height: 55)
            .foregroundColor(.white)
            .background(.navy)
            .cornerRadius(12)

            Text("Send Reminder")
                .fontWeight(.semibold)
                .padding(.bottom, 50)
            
            Spacer()
        }
        .navigationTitle("Meet Your Friend")
        .navigationBarTitleDisplayMode(.inline)
        .tabViewStyle(.automatic)
        .background(
            RadialGradient(gradient: Gradient(colors: [.beige, .white]),
                           center: .center,
                           startRadius: 0,
                           endRadius: 500)
        )
    }
    
    
    func timerPet(){
        
        var index = 1
        var maxIndex = 0
        
        if (friend.avatar == "Fox") {
            maxIndex = 14
        } else if (friend.avatar == "rabbit") {
            maxIndex = 9
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.20, repeats: true) { (Timer) in
            
            pet = "\(friend.avatar)\(index)"
            
            index += 1
            
            if (index > maxIndex) {
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
