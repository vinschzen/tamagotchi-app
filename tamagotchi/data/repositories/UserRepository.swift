//
//  UserRepository.swift
//  tamagotchi
//
//  Created by MacBook Air on 11/09/24.
//

import Foundation

protocol UserRepository {
    func fetch() async -> [User]
    func create(username: String, password: String) async -> User
    func update(item: User) async
    func delete(item: User) async
}
