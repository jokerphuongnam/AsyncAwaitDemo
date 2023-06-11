//
//  ObserverUseCase.swift
//  AsyncAwaitDemo
//
//  Created by pnam on 11/06/2023.
//

import Foundation

protocol ObserverUseCaseProtocol {
    func observerUsers() -> AsyncThrowingStream<[User], Error>
}

final class ObserverUseCase: ObserverUseCaseProtocol {
    static let shared: ObserverUseCaseProtocol = ObserverUseCase(userRepository: UserRepository.shared)
    private let userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    func observerUsers() -> AsyncThrowingStream<[User], Error> {
        userRepository.observerUsers()
    }
}
