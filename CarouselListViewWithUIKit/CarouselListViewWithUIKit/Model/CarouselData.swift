//
//  CarouselData.swift
//  CarouselSearchListUsingSwiftUI
//
//  Created by Naresh Muthuluri on 28/10/24.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String 
}


struct MockData {
    static let sampleItems = Item(name: "Apple", description: "A juicy red fruit.", imageName: "apple")
    static let items = [sampleItems, sampleItems, sampleItems, sampleItems]
}
