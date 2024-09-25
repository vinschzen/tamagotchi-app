//
//  Item.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//]

//
//  Item.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//
import Foundation
import SwiftData

@Model
final class User: Codable {
    enum CodingKeys: CodingKey {
        case id, name, level, money, ShopItems
    }
    
    @Attribute(.unique) var id: String = UUID().uuidString

    var name: String
    var level: Float
    var money: Int
    var ShopItems: [ShopItem]

    init(name: String, level: Float, money: Int) {
        self.name = name
        self.level = level
        self.money = money
        self.ShopItems = [
            ShopItem(name: "Clover", image: "leaf" , price: 20, status: false),
            ShopItem(name: "Chick", image: "chick" , price: 20, status: false),
            ShopItem(name: "Flower", image: "flower" , price: 20, status: false),
            ShopItem(name: "Ribbon", image: "ribbon" , price: 20, status: false),
        ]
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        level = try container.decode(Float.self, forKey: .level)
        money = try container.decode(Int.self, forKey: .money)
        ShopItems = try container.decode([ShopItem].self, forKey: .ShopItems)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(level, forKey: .level)
        try container.encode(money, forKey: .money)
        try container.encode(ShopItems, forKey: .ShopItems)
    }
}
