//
//  SearchView.swift
//  Wishlist
//
//  Created by Maëlys Callens on 04/01/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchPrice = ""
    
    @State private var showResults = false
    @State private var showAlert = false
    
    @ObservedObject var api = Api()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Maximum price...", text: $searchPrice)
                                    .padding()
                        
                Button(action: {
                    updateToys(withMaxPrice: searchPrice)
                    self.showResults = true
                }) {
                    Text("Search")
                        .font(.headline)
                        .padding()
                }
                        
                if showResults {
                    List(api.toys) { toy in
                        NavigationLink(destination: ToyDetailsView(toy: toy)) {
                            ToyRow(toy: toy)
                        }
                    }
                }
            }
            .navigationTitle("Search for toys")
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("You have entered an invalid search price. Please try again."), dismissButton: .default(Text("OK")))
        }
        

    }
            
    private func updateToys(withMaxPrice maxPrice: String) {
        if !searchPrice.isEmpty && !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: searchPrice)) {
            // Waarschuw de gebruiker dat de ingevoerde prijs ongeldig is
            self.searchPrice = ""
            self.showAlert = true
            return
        }
        
        api.loadDataWithMaximumPrice(maxPrice: maxPrice) { toys in
            self.api.toys = toys
        }
    }
}

#Preview {
    SearchView()
}
