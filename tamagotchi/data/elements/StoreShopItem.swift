//
//  ShopItem.swift
//  tamagotchi
//
//  Created by MacBook Air on 23/09/24.
//

import Foundation
import SwiftUI

struct StoreShopItem: View {
    
    @State var i:ShopItem
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(.white)
            VStack{
                
                Image(i.image).resizable()
                    .scaledToFit()
                    .padding(.top, 8)
                
                if (i.status) {
                    Text( "Purchased" )
                        .font(.system(size: 18))
                        .padding(.bottom, 5)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                }
                else {
                    Text( "$ "+String(i.price))
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
    }
}
