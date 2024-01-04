//
//  ToyDetailsView.swift
//  Wishlist
//
//  Created by Maëlys Callens on 03/01/2024.
//

import SwiftUI

struct ToyDetailsView: View {
    
    var toy: Toy
    
    var body: some View {
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
                    //Verwijderen van toy aan API zodat het niet meer in de lijst staat
                    //als je drukt op knop kom je weer op ToyView uit
                }) {
                    Text("Delete toy")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }
}


//#Preview {
//    ToyDetailsView()
//}

struct ToyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ToyDetailsView(toy: Toy(name: "Test Toy",  info: "testen", category: "Test info", img_url: "Testen", price: 10.99, user_id: "63fark5bc079877f4ec47bc9", date_created: "2023-02-27T18:28:02.916Z"))
    }
}
