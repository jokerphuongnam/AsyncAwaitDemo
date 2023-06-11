//
//  GetViewModel.swift
//  AsyncAwaitDemo
//
//  Created by pnam on 11/06/2023.
//

import Foundation

final class GetViewModel: ObservableObject {
    private let useCase: GetUseCaseProtocol
    @Published var users: State<[User]> = .loading
    
    init(useCase: GetUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func loadUsers() {
        Task(priority: .utility) {
            do {
                users = .success(try await useCase.getUsers())
            } catch {
                users = .error(error)
            }
        }
    }
}
