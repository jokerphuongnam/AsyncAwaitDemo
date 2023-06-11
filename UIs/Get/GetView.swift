//
//  GetView.swift
//  AsyncAwaitDemo
//
//  Created by pnam on 11/06/2023.
//

import SwiftUI

struct GetView: View {
    @StateObject var viewModel: GetViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                Button {
                    viewModel.loadUsers()
                } label: {
                    Text("Refresh")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                data
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 32)
        }
        .onAppear {
            viewModel.loadUsers()
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
struct GetView_Previews: PreviewProvider {
    static var previews: some View {
        GetView(viewModel: .init(useCase: GetUseCase.shared))
    }
}
#endif
