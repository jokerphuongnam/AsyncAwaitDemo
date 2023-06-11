//
//  ContentView.swift
//  AsyncAwaitDemo
//
//  Created by pnam on 11/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                ForEach(Self.Page.allCases, id: \.self) { page in
                    NavigationLink {
                        page.destination
                    } label: {
                        Text(page.label)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .navigationTitle("Async await demo")
        }
    }
}

private extension ContentView {
    enum Page: CaseIterable {
        case get, observer
        
        var label: String {
            switch self {
            case .get:
                return "Get"
            case .observer:
                return "Observer"
            }
        }
        
        @ViewBuilder var destination: some View {
            switch self {
            case .get:
                GetView(viewModel: .init(useCase: GetUseCase.shared))
            case .observer:
                ObserverbleView(viewModel: .init(useCase: ObserverUseCase.shared))
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
