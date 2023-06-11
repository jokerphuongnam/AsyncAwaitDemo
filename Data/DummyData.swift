//
//  DummyData.swift
//  AsyncAwaitDemo
//
//  Created by pnam on 11/06/2023.
//

import Foundation

struct User: Hashable, Identifiable {
    let id: String = UUID().uuidString
    let name: String
    
    init() {
        name = DummyData.shared.names.random
    }
}

enum State<T> {
    case loading
    case success(_ data: T)
    case error(_ error: Error)
}

extension State where T: Equatable {
    
}

struct DummyData {
    static let shared: Self = .init()
    
    let names = [
        "Trường Hoàng",
        "Đặng Bảo",
        "Huỳnh Tú",
        "Hoàng Khang",
        "Đinh Nam",
        "Thị Ngọc",
        "Huỳnh Khương",
        "Loser",
        "Bích Yên",
        "Hoa Văn",
        "Chí Thùy",
        "Hùng Công",
        "Hà Hằng",
        "Bảo Yên",
        "Đạt Văn",
        "Anh Phúc",
        "Trai Chí",
        "Diệu Phương",
        "Đạt Linh",
        "Thanh Thu",
        "Khánh Thảo",
        "Viên Huy",
        "Bình Tuyến",
    ]
    
    let avatars = [
        "https://images.dog.ceo/breeds/affenpinscher/n02110627_4457.jpg",
        "https://images.dog.ceo/breeds/whippet/n02091134_15251.jpg",
        "https://images.dog.ceo/breeds/terrier-kerryblue/n02093859_467.jpg",
        "https://images.dog.ceo/breeds/chihuahua/n02085620_3681.jpg",
        "https://images.dog.ceo/breeds/affenpinscher/n02110627_2997.jpg",
        "https://images.dog.ceo/breeds/pyrenees/n02111500_6857.jpg",
        "https://images.dog.ceo/breeds/spaniel-blenheim/n02086646_2173.jpg",
        "https://images.dog.ceo/breeds/mastiff-bull/n02108422_964.jpg",
        "https://images.dog.ceo/breeds/briard/n02105251_4893.jpg",
        "https://images.dog.ceo/breeds/pomeranian/n02112018_888.jpg",
        "https://images.dog.ceo/breeds/affenpinscher/n02110627_11811.jpg",
        "https://images.dog.ceo/breeds/mountain-swiss/n02107574_988.jpg",
    ]
}

extension Array {
    var random: Element {
        self[Int.random(in: 0..<count)]
    }
}
