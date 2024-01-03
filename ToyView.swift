//
//  ToyView.swift
//  Wishlist
//
//  Created by Maëlys Callens on 02/01/2024.
//

import SwiftUI

struct ToyView: View {
    
    @State var selectedToy: Toy?
    @State var toys = [Toy]()
    
    var body: some View {
            List(toys) { toy in
//                NavigationLink(destination: ToyDetailsView(toy: $selectedToy), tag: toy, selection: $selectedToy) {
                                    ToyRow(toy: toy)
                //}
            }.onAppear() {
                Api().loadData { (toys) in
                    self.toys = toys
                }
            }.navigationTitle("Toy List")
    }
}

#Preview {
    ToyView()
}

struct ToyRow: View {
    
    let toy: Toy
    
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: toy.img_url)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                case .failure:
                    Image(systemName: "photo") // Als foto niet aanwzig is in API, dan word er deze foto geplaatst
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                case .empty:
                    ProgressView() // Er wordt een laadindicator toegevoegd terwijl de afbeelding wordt geladen
                @unknown default:
                    EmptyView()
                }
            }
            Text("\(toy.name)")
            Text("\(String(format: "%.2f", toy.price)) €")
        }
    }
}
