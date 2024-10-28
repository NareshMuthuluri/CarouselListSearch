//
//  ContentView.swift
//  CarouselSearchListUsingSwiftUI
//
//  Created by Naresh Muthuluri on 28/10/24.
//

import SwiftUI

struct CarouselSearchListView: View {
    @StateObject private var viewModel = CarouselViewModel()
    @State private var isShowingBottomSheet = false
    
    var body: some View {
        VStack {
            CarouselView(items: viewModel.items)
            HStack {
                TextField("Search", text: $viewModel.searchTerm)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.top)
            
            List {
                ForEach(viewModel.filteredItems) { item in
                    ZStack {
                        HStack {
                            Image(item.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.description)
                                    .font(.subheadline)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .overlay(
            Button(action: {
                isShowingBottomSheet.toggle()
            }) {
                Image(systemName: "ellipsis")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
                .sheet(isPresented: $isShowingBottomSheet) {
                    BottomSheetView(viewModel: viewModel)
                }
            
                .padding(),
            alignment: .bottomTrailing
        )
    }
}

#Preview {
    CarouselSearchListView()
}
