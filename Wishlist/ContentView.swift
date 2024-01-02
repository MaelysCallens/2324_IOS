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
        ToyView()
    }
}

#Preview {
    ContentView()
}
