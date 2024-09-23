import SwiftUI
import UserNotifications

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler:
                                @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}

struct MeetFriendsView: View {
    var friend: Friend
    
    @State private var showAlert: Bool = false
    @State private var pet: String = ""
    let notificationDelegate = NotificationDelegate()
    
    @State private var isButtonDisabled: Bool = false
    @State private var cooldownTime: Int = 0
    @State private var timer: Timer? = nil
    
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
                showAlert = true
            }) {
                if isButtonDisabled {
                    Text("Wait \(cooldownTime)s")
                        .fontWeight(.semibold)
                } else {
                    Image(systemName: "exclamationmark.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .scaledToFit()
                }
            }
            .disabled(isButtonDisabled)
            .padding()
            .frame(width: 130, height: 55)
            .foregroundColor(.white)
            .background(Color.navy)
            .cornerRadius(12)
            .buttonStyle(BorderlessButtonStyle())
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Send Reminder"),
                    message: Text("Do you want to send a reminder to \(friend.name)?"),
                    primaryButton: .default(Text("Send")) {
                        sendNotification()
                        startCooldown()
                    },
                    secondaryButton: .cancel()
                )
            }
            
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
        .onAppear {
            requestNotificationPermission()
            UNUserNotificationCenter.current().delegate = notificationDelegate
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("An error occurred while requesting notification permissions: \(error.localizedDescription)")
            } else if granted {
                print("Notification permissions granted.")
            } else {
                print("Notification permissions denied.")
            }
        }
    }
    
    func sendNotification() {
        let content = UNMutableNotificationContent()
        
//        let senderName = UIDevice.current.name
        let senderName = "Razor"
        let message = "\(senderName) has reminded you to complete your task. ⏰"
        
        content.title = "Task Reminder 📌"
        content.body = message
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "reminderNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("An error occurred while scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification successfully scheduled.")
            }
        }
    }
    
    func startCooldown() {
        cooldownTime = 5
        isButtonDisabled = true
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if cooldownTime > 0 {
                cooldownTime -= 1
            } else {
                timer.invalidate()
                isButtonDisabled = false
            }
        }
    }
    
    func timerPet() {
        var index = 1
        var maxIndex = 0
        
        if friend.avatar == "Fox" {
            maxIndex = 14
        } else if friend.avatar == "rabbit" {
            maxIndex = 9
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.20, repeats: true) { _ in
            pet = "\(friend.avatar)\(index)"
            index += 1
            if index > maxIndex {
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
