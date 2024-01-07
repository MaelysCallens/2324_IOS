//
//  ToyView.swift
//  Wishlist
//
//  Created by Maëlys Callens on 02/01/2024.
//

import SwiftUI

struct ToyView: View {
    
    @State var toys = [Toy]()
    
    @State private var isDeletable = false
    
    var body: some View {
        NavigationView {
            List(toys) { toy in
                NavigationLink(destination: ToyDetailsView(toy: toy, isDeletable: $isDeletable)) {
                    ToyRow(toy: toy)
                }
            }.onAppear() {
                Api().loadData { (toys) in
                    self.toys = toys
                    isDeletable = true
                }
            }
        }
        .navigationTitle("Wishlist")
    }
}

#Preview {
    ToyView()
}

struct ToyRow: View {
    
    let toy: Toy
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                getAsyncImage(forCategory: toy.category)
                HStack {
                    Text("\(toy.name)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack {
                    Text("\(String(format: "%.2f", toy.price)) €")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
    }
}
