//
//  ToyDetailsView.swift
//  Wishlist
//
//  Created by Maëlys Callens on 03/01/2024.
//

import SwiftUI

struct ToyDetailsView: View {
    
    var toy: Toy
    
    //Delete button mag enkel maar zichtbaar zijn als je vanuit ToyView op toy drukt
    @Binding var isDeletable: Bool
    
    @State private var showAlert = false
    
    var body: some View {
        getAsyncImage(forCategory: toy.category)
        Form {
            Section(header: Text("Name")) {
                Text(toy.name)
            }
            Section(header: Text("Category")) {
                Text(toy.category)
            }
            Section(header: Text("Price")) {
                Text("\(String(format: "%.2f", toy.price)) €")
            }
            Section(header: Text("Image url")) {
                Text(toy.img_url)
            }
            Section(header: Text("Info")) {
                Text(toy.info)
            }
            Section {
                Button(action: {
                    deleteToy(id: toy.id)
                }) {
                    Text("Delete toy from wishlist")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                }
                .opacity(isDeletable ? 1 : 0)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("There was an error when deleting the toy. Please try again later."), dismissButton: .default(Text("OK")))
        }
    }
    
    func deleteToy(id: UUID) {
        Api().DeleteToy(id: id) { success in
            if success {
                print("Toy was successfully deleted!")
            } else {
                print("Error deleting toy!")
                self.showAlert = true
            }
        }
    }
}


//#Preview {
//    ToyDetailsView()
//}

struct ToyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let toy = Toy(name: "Test Toy",  info: "Testen", category: "Test info", img_url: "https://itmg.nl/wp-content/uploads/2021/04/introTest.jpg", price: 10.99, user_id: "63fark5bc079877f4ec47bc9", date_created: "2023-02-27T18:28:02.916Z")
        ToyDetailsView(toy: toy,  isDeletable: .constant(true))
    }
}
