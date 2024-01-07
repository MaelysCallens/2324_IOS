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
                    //Verwijderen van toy aan API zodat het niet meer in de lijst staat
                    //als je drukt op knop kom je weer op ToyView uit
                }) {
                    Text("Delete toy from wishlist")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                }
                .opacity(isDeletable ? 1 : 0)
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
