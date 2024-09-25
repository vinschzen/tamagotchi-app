import SwiftUI

struct SelectPet: View {
    @State private var pet : String = "rabbit"
    @State private var image : String = "rabbit"
    @State private var maxIndex = 9


    var body: some View {
        NavigationView {
            VStack(alignment:.center){
                Spacer()
                Text("Choose your companion!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Text("These cute little shits are lively, \n social and inquisitive.")
                    .font(.system(size: 22))
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.top, 10)
                    .multilineTextAlignment(.center)
                Text("This is your spirit animal!")
                    .font(.system(size: 22))
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.top, 10)
                Image(pet)
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 400, alignment: .center)
                                   .onAppear(perform: timerPet)
                               

                ZStack{
                    VStack{
                        HStack{
                            Button(action: {
                                image="rabbit"
                                maxIndex=9
                            }, label: {
                                Image("eggrabbit")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:120)
                            })
                            Spacer()
                            Button(action: {
                                image="Fox"
                                maxIndex=14
                            }, label: {
                                Image("eggfox")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:120)
                            })
                        }
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        Button(action: {
                            image="axolotl"
                            maxIndex=2
                        }, label: {
                            Image("eggaxo")
                                .resizable()
                                .scaledToFit()
                                .frame(height:120)
                        })
                    }
                }
                .padding(20)
                .frame(height:200)
            }
            .navigationBarTitle("Select Pet", displayMode: .inline)
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
    SelectPet()
}

