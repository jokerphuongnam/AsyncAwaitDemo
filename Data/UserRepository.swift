//
//  UserRepository.swift
//  AsyncAwaitDemo
//
//  Created by pnam on 11/06/2023.
//

import Foundation

protocol UserRepositoryProtocol {
    func getUsers() async throws -> [User]
    func observerUsers() -> AsyncThrowingStream<[User], Error>
}

final class UserRepository: UserRepositoryProtocol {
    static let shared: UserRepositoryProtocol = UserRepository()
    private let dummyData = DummyData.shared
    
    func getUsers() async throws -> [User] {
        sleep(1)
        guard Bool.random() else {
            throw AppError.data
        }
        return createRandomUsers()
    }
    
    func observerUsers() -> AsyncThrowingStream<[User], Error> {
        AsyncThrowingStream { continuation in
            defer {
                continuation.finish()
            }
            while Int.random(in: 0..<50) != 42 {
                continuation.yield(createRandomUsers())
            }
        }
    }
    
    private func createRandomUsers() -> [User] {
        var users: [User] = []
        for _ in 0...Int.random(in: 1..<30) {
            users.append(.init())
        }
        return users
    }
}
