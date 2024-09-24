//
//  ShopItem.swift
//  tamagotchi
//
//  Created by MacBook Air on 23/09/24.
//

import Foundation

struct ShopItem: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var image: String
    var price: Int
    var status: Bool
}
