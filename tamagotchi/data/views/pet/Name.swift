import SwiftUI

struct Name: View {
    @State private var pet : String = "rabbit"
    @State private var image : String = "rabbit"
    @State private var maxIndex = 9
    @State private var name : String = ""


    var body: some View {
        NavigationView {
            VStack(alignment:.center){
                Spacer()
                Text("Name your companion!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                TextField("Name", text: $name)
                    .font(.system(size: 24))
                    .padding(.top,30)
                    .multilineTextAlignment(.center)
                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.gray)
                                    .padding(.leading, 36)
                                    .padding(.trailing, 36)
                Image(pet)
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 400, alignment: .center)
                                   .onAppear(perform: timerPet)
                NavigationLink(destination: PetMainView()){
                    HStack{
                        Text("Shop").font(.system(size: 16))
                            .fontWeight(.semibold)
                    }
                            .foregroundStyle(Color.white)
                            .padding(8)
                            .background(Color("RColor"))
                            .cornerRadius(15)
                }
            }
            .navigationBarTitle("Name", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Handle left button action in navigation bar
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                }
            }
            
        }
        .tabViewStyle(.automatic)
    }
    func timerPet() {
           var index = 1
           if image == "Fox" {
               maxIndex = 14
           } else if image == "rabbit" {
               maxIndex = 9
           } else if image == "axolotl" {
               maxIndex = 2
           }
           
           _ = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { _ in
               pet = "\(image)\(index)"
               index += 1
               if index > maxIndex {
                   index = 1
               }
           }
       }

}

#Preview{
    Name()
}

