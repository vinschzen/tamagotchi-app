//
//  Item.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//]

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var name: String
    var password: String
    var streak: Int
    var level: Float
}
