//
//  CarouselViewModel.swift
//  CarouselSearchListUsingSwiftUI
//
//  Created by Naresh Muthuluri on 28/10/24.
//

import Foundation
import Combine

class CarouselViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    @Published var searchTerm: String = ""
    
    
    init() {
        items = [
            Item(name: "Apple", description: "A juicy red fruit.", imageName: "apple"),
            Item(name: "Banana", description: "A long yellow fruit.", imageName: "banana"),
            Item(name: "Cherry", description: "A small red fruit.", imageName: "orange"),
            Item(name: "Blueberry", description: "A sweet brown fruit.", imageName: "blueberry")
        ]
    }
    
    var itemCount: Int {
        items.count
    }
    
    var characterOccurrences: [(character: Character, count: Int)] {
        let characterCount = items
            .flatMap { $0.name.lowercased() }
            .reduce(into: [Character: Int]()) { counts, character in
                counts[character, default: 0] += 1
            }
        
        return characterCount
            .sorted { $0.value > $1.value }
            .prefix(3)
            .map { ($0.key, $0.value) }
    }
}
