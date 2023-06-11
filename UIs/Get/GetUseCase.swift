//
//  GetUseCase.swift
//  AsyncAwaitDemo
//
//  Created by pnam on 11/06/2023.
//

import Foundation

protocol GetUseCaseProtocol {
    func getUsers() async throws -> [User]
}

final class GetUseCase: GetUseCaseProtocol {
    static let shared: GetUseCaseProtocol = GetUseCase(userRepository: UserRepository.shared)
    private let userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    func getUsers() async throws -> [User] {
        try await userRepository.getUsers()
    }
}
