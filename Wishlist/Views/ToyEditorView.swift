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
    
    @State private var error: Error?
    @State private var isLoading = false
    @State private var isValid = false
    
    @State private var showAlert = false
    
    var body: some View {
        Text("Add a toy to your wishlist")
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text: $name)
                    .onChange(of: name) { _ in
                            checkValidity()
                        }
            }
            Section(header: Text("Category")) {
                TextField("Category", text: $category)
                    .onChange(of: category) { _ in
                            checkValidity()
                        }
            }
            Section(header: Text("Price")) {
                TextField("Price", value: $price, formatter: NumberFormatter.currencyFormatter)
                    .onChange(of: price) { _ in
                            checkValidity()
                        }
            }
            Section(header: Text("Image url")) {
                TextField("Image url", text: $img_url)
            }
            Section(header: Text("Info")) {
                TextField("Info", text: $info)
                    .onChange(of: info) { _ in
                            checkValidity()
                        }
            }
            Section {
                Button(action: {
                    //toevoegen van toy aan API zodat het in lijst komt te staan
                    //als je drukt op knop kom je weer op ToyView uit
                    self.addToy()
                }) {
                    Text("Add toy")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                }
                .disabled(!isValid)
            }
        }
        .onAppear {
            //Opzetten van cijfers na de komma bij prijs
            NumberFormatter.currencyFormatter.minimumFractionDigits = 2
            NumberFormatter.currencyFormatter.maximumFractionDigits = 2
        }
        .alert(isPresented: Binding<Bool>(get: { self.error != nil }, set: { _, _ in self.error = nil })) {
            Alert(title: Text("Error"), message: Text(self.error?.localizedDescription ?? "Unknown error occurred."), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("There was an error when adding the toy. Please try again later."), dismissButton: .default(Text("OK")))
        }
    }
    
    func checkValidity() {
        isValid = !name.isEmpty && !category.isEmpty && price > 0 && !info.isEmpty
    }
    
    func addToy() {
        let toyData: [String: Any] = [
            "name": name,
            "info": info,
            "category": category,
            "img_url": img_url,
            "price": price
        ]

        Api().AddToy(toyData: toyData) { result in
            switch result {
            case .success(let data):
                print("Toy added successfully! Data: \(data)")
            case .failure(let error):
                print("Error adding toy: \(error)")
                self.showAlert = true
            }
        }
    }
}

#Preview {
    ToyEditorView()
}
