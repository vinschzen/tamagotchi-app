//
//  Friend.swift
//  tamagotchi
//
//  Created by MacBook Pro on 20/09/24.
//

import Foundation

struct Friend: Identifiable {
    let id = UUID()
    let name: String
    let avatar: String
    let level: Int
}
