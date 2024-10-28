//
//  BottomSheetView.swift
//  CarouselSearchListUsingSwiftUI
//
//  Created by Naresh Muthuluri on 28/10/24.
//

import SwiftUI

struct BottomSheetView: View {
    @ObservedObject var viewModel: CarouselViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Statistics")
                .font(.headline)
                .padding()

            Text("Total Items: \(viewModel.itemCount)")
                .padding(.bottom)

            Text("Top 3 Occurrences:")
                .font(.subheadline)
                .padding(.bottom)

            ForEach(viewModel.characterOccurrences, id: \.character) { character, count in
                Text("\(character) = \(count)")
            }
            
            Spacer()
        }
        .padding()
        .frame(maxHeight: 300)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
    }
}
