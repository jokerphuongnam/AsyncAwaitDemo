//
//  ObserverbleView.swift
//  AsyncAwaitDemo
//
//  Created by pnam on 11/06/2023.
//

import SwiftUI

struct ObserverbleView: View {
    @StateObject var viewModel: ObserverViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                Button {
                    
                } label: {
                    Text("Test")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Text("Update time: \(viewModel.date.fullTime)")
                
                data
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 32)
        }
        .onAppear {
            viewModel.loadUsers()
        }
        .onDisappear {
            viewModel.cancel()
        }
    }
    
    @ViewBuilder var data: some View {
        switch viewModel.users {
        case .loading:
            ProgressView()
        case .success(let data):
            ForEach(data, id: \.id) { element in
                Text(element.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        case .error(let error):
            Text(error.localizedDescription)
        }
    }
}

#if DEBUG
struct ObserverbleView_Previews: PreviewProvider {
    static var previews: some View {
        ObserverbleView(viewModel: .init(useCase: ObserverUseCase.shared))
    }
}
#endif
