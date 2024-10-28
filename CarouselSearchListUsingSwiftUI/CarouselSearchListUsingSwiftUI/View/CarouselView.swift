//
//  CarouselView.swift
//  CarouselSearchListUsingSwiftUI
//
//  Created by Naresh Muthuluri on 28/10/24.
//

import SwiftUI

struct CarouselView: View {
    let items: [Item]
    
    @State private var currentIndex: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentIndex) {
                ForEach(items.indices, id: \.self) { index in
                    Image(items[index].imageName)
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .cornerRadius(10)
                        .padding()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            HStack(spacing: 8) {
                ForEach(items.indices, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? Color.blue : Color.gray)
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.bottom, 10)
        }
        .frame(height: 250)
    }
}

#Preview {
    CarouselView(items: MockData.items)
}
