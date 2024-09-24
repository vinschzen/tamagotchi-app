//
//  UserData.swift
//  tamagotchi
//
//  Created by MacBook Air on 24/09/24.
//

import Foundation

class UserData: ObservableObject {
    @Published var level:Float = 100
    @Published var money:Int = 300
    @Published var ShopItems: [ShopItem] = [
        ShopItem(name: "Clover", image: "leaf" , price: 20, status: false),
        ShopItem(name: "Chick", image: "chick" , price: 20, status: false),
        ShopItem(name: "Flower", image: "flower" , price: 20, status: false),
        ShopItem(name: "Ribbon", image: "ribbon" , price: 20, status: false),
    ]
    
}
