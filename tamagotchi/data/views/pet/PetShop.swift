//
//  PetShop.swift
//  tamagotchi
//
//  Created by MacBook Air on 20/09/24.
//

import SwiftUI

struct PetShop: View {
    @State private var selectedIndex: Int = 0
    @State var Rabbit : String = ""
    @State var Accessories : String = ""
    @State private var ShopItems: [ShopItem] = [
        ShopItem(name: "Clover", image: "leaf" , price: 20, status: false),
        ShopItem(name: "Chick", image: "chick" , price: 20, status: false),
        ShopItem(name: "Flower", image: "flower" , price: 20, status: false),
        ShopItem(name: "Ribbon", image: "ribbon" , price: 20, status: false),
    ]
    @State var toggle: Bool = false
    @State var isHidden: Bool = true
    @State var isAcc: Bool = true
    @Binding var currency: Int
    @State private var animated_index = 0
    
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment: .trailing){
                    HStack{
                        Spacer()
                        Text(String(currency))
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.orange)
                    }.padding(.trailing, 5)
                }.padding([.top, .trailing], 20)
                Text("Customize Your Pet!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                ZStack{
                    AnimatedImage(name: Rabbit, dir: "rabbit")
                    if !isAcc{
                        Image(ShopItems[selectedIndex].image + "\(animated_index)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 400, alignment: .center)
                            .onAppear(perform: animate)
                    }
                    if !isHidden{
                        Button(action: {
                            toggle = true
                        }, label: {
                            Text("BUY").fontWeight(.bold)
                        })
                        .padding(8)
                        .alert(isPresented: $toggle) {
                            Alert(
                                title: Text("Konfirmasi pembelian item"),
                                message: Text("Nama item : \(ShopItems[selectedIndex].name) \n Harga item :  \(ShopItems[selectedIndex].price)"),
                                primaryButton: .destructive(Text("OK")) {
                                    ShopItems[selectedIndex].status = true
                                    currency = currency-ShopItems[selectedIndex].price
                                },
                                secondaryButton: .cancel()
                                
                                
                            )
                        }
                        .padding(.top, 310)
                    }
                }.frame(height:280)
                ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                                ForEach(0..<ShopItems.count) { i in

                                    Button(action:{
                                        isAcc = false
                                        isHidden = false
                                        
                                        selectedIndex = i
                                        print(i)
                                                                                //alert confirm then
                                    }, label: {
//                                        StoreShopItem(i: ShopItems[i])
                                        ZStack{
                                            Rectangle().foregroundColor(.white)
                                            VStack{
                                                
                                                Image(ShopItems[i].image).resizable()
                                                    .scaledToFit()
                                                    .padding(.top, 8)
                                                
                                                if (ShopItems[i].status) {
                                                    Text( "Purchased" )
                                                        .font(.system(size: 18))
                                                        .padding(.bottom, 5)
                                                        .foregroundColor(.black)
                                                        .fontWeight(.semibold)
                                                }
                                                else {
                                                    Text( "$ "+String(ShopItems[i].price))
                                                        .font(.system(size: 18))
                                                        .padding(.bottom, 5)
                                                        .foregroundColor(.black)
                                                        .fontWeight(.semibold)
                                                }
                                                
                                            }
                                        }
                                            .background(.white)
                                            .cornerRadius(10)
                                            .padding(8)
                                            .frame(height: 120)
                                            .shadow(color: .gray, radius: 5, x: 3, y: 4)
                                    })
                                }
                            }.padding()
                }.padding(30)
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

//#Preview {
//    PetShop()
//}