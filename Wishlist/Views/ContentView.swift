//
//  ContentView.swift
//  Wishlist
//
//  Created by Maëlys Callens on 02/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            TabView {
                ToyView()
                    .tabItem {
                        Label("Wishlist", systemImage: "square.grid.2x2")
                    }
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ToyEditorView()) {
                        Text("Add toy to wishlist")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
