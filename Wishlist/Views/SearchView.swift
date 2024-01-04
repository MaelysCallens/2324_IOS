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
    
    @State private var notification: Notification? = nil
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
        if let notification = notification {
                Text(notification.message)
                    .padding()
                    //.background(Color.red)
                    .foregroundColor(.red)
                    .transition(.scale)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + notification.displayTime) {
                            withAnimation {
                                self.notification = nil
                            }
                        }
                    }
            }
    }
            
    private func updateToys(withMaxPrice maxPrice: String) {
        if !searchPrice.isEmpty && !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: searchPrice)) {
            // Waarschuw de gebruiker dat de ingevoerde prijs ongeldig is
            self.searchPrice = ""
            self.notification = Notification(message: "Invalid search price.")
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