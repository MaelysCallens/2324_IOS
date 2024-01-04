//
//  ContentView.swift
//  Wishlist
//
//  Created by Maëlys Callens on 02/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var toys = [Toy]()
    
    var body: some View {
        NavigationView {
            ToyView()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ToyEditorView()) {
                        Text("Add toy to wishlist")
                    }
                }                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SearchView()) {
                        Label("Search", systemImage: "magnifyingglass")
                    }
            }

            }
        }
    }
}

#Preview {
    ContentView()
}
