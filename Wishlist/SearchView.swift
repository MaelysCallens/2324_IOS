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
                        VStack(alignment: .leading) {
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
            .navigationBarTitle("Search for toys in your wishlist")
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
