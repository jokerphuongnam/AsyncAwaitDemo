//
//  ObserverViewModel.swift
//  AsyncAwaitDemo
//
//  Created by pnam on 11/06/2023.
//

import Foundation

final class ObserverViewModel: ObservableObject {
    private let useCase: ObserverUseCaseProtocol
    private var userTask: Task<(), Never>? = nil
    @Published var users: State<[User]> = .loading
    @Published var date: Date = .now
    
    init(useCase: ObserverUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func loadUsers() {
        userTask = Task(priority: .utility) {
            let observerUsers = useCase.observerUsers()
            do {
                for try await users in observerUsers {
                    await MainActor.run {
                        date = .now
                        self.users = .success(users)
                    }
                }
            }
            catch {
                await MainActor.run {
                    date = .now
                    users = .error(error)
                }
            }
        }
    }
    
    func cancel() {
        userTask?.cancel()
    }
}
