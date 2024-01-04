//
//  ToyEditorView.swift
//  Wishlist
//
//  Created by Maëlys Callens on 03/01/2024.
//

import SwiftUI

struct ToyEditorView: View {
    
    @State private var name = ""
    @State private var info = ""
    @State private var category = ""
    @State private var img_url = ""
    @State private var price = 0.00
    
    var body: some View {
        Text("Add a toy to your wishlist")
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text: $name)
            }
            Section(header: Text("Category")) {
                TextField("Category", text: $category)
            }
            Section(header: Text("Price")) {
                TextField("Price", value: $price, formatter: NumberFormatter.currencyFormatter)
            }
            Section(header: Text("Image url")) {
                TextField("Image url", text: $img_url)
            }
            Section(header: Text("Info")) {
                TextField("Info", text: $info)
            }
            Section {
                Button(action: {
                    //toevoegen van toy aan API zodat het in lijst komt te staan
                    //als je drukt op knop kom je weer op ToyView uit
                }) {
                    Text("Add toy")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .onAppear {
                    // Set up number formatter properties (if needed)
                    NumberFormatter.currencyFormatter.minimumFractionDigits = 2
                    NumberFormatter.currencyFormatter.maximumFractionDigits = 2
        }
    }
}


#Preview {
    ToyEditorView()
}
