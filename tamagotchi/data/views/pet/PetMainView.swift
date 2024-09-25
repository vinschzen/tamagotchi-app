import SwiftUI
import SwiftData

struct PetMainView: View {
    @State private var currency: Int = 300
    @State private var selectedIndex: Int = 0
    @State var Rabbit : String = ""
    @State private var animated_index = 0
    
    var current_user = UserData.shared

    var body: some View {
            VStack {
                VStack(alignment: .trailing){
                    HStack{
                        OtherView()
                        Spacer()
                        NavigationLink(destination: PetShop(currency: $currency)){
                            HStack{
                                Text("Shop").font(.system(size: 16))
                                    .fontWeight(.semibold)
                                Image(systemName: "cart.fill")
                                
                            }
                                    .foregroundStyle(Color.white)
                                    .padding(8)
                                    .background(Color("RColor"))
                                    .cornerRadius(15)
                        }
                        
                    }
                    HStack{
                        Spacer()
                        Text(String(current_user.money))
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.orange)
                    }.padding(.trailing, 5)
                    
                }.padding([.top, .trailing], 20)
                
                Spacer()
                Text("Reading Book")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Text("13 minutes remaining")
                    .foregroundStyle(.secondary)
                    .fontWeight(.light)
                    .padding(2)
                Text(current_user.name)
                    .font(.system(size: 22))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                //ANIMASI HEWAN DAN AKSESORIS
                ZStack{
                    Image(Rabbit)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 350, alignment: .center)
                        .onAppear(perform: timerRabbit)
                    
                    
                    Image("\(current_user.equipped)\(animated_index)")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 350, alignment: .center)
                        .onAppear(perform: animate)
                }
                
                ProgressView(value: current_user.level/100)
                                .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
                                .frame(width: 200)
                                .padding(.bottom, 15)
                            
                Text("Level \(1 + Int(floor(current_user.level/100)))")
                                .font(.title3)
                                .padding(.bottom, 30)
  
            }
            .navigationBarTitle("Pet Screen", displayMode: .inline)
            .toolbar {
            }
        .tabViewStyle(.automatic)
    }
    func timerRabbit(){
            
      var index = 1
        _ = Timer.scheduledTimer(withTimeInterval: 0.75, repeats: true) { (Timer) in
                
            Rabbit = "rabbit\(index)"
                
            index += 1
                
            if (index > 9){
                index = 1
                
                }
            }
        }
    func animate() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.75, repeats: true) { (Timer) in
                        
            animated_index += 1
                
            if (animated_index > 9){
                animated_index = 1
                
                
            }
        }
    }
    
    
}

#Preview{
    PetMainView()
}

#Preview{
    PetMainView()
}
