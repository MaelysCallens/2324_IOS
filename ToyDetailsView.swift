//
//  ToyDetailsView.swift
//  Wishlist
//
//  Created by Maëlys Callens on 03/01/2024.
//

import SwiftUI

struct ToyDetailsView: View {
    
//    @Binding var toy: Toy
    
    enum Focused {
        case name
        case info
        case category
        case img_url
        case price
    }
    
    @State private var focused: Focused = .name
    
//    @State private var name = ""
//    @State private var info = ""
//    @State private var category = ""
//    @State private var img_url = ""
//    @State private var price = 0.00
    
    var body: some View {
        Text("Add a toy to your wishlist")
//        Form {
//            Section(header: Text("Name")) {
//                TextField("Name", text: $toy.name)
//                    .focused($focused, equals: .name)
//            }
//            Section(header: Text("Category")) {
//                TextField("Category", text: $toy.category)
//                    .focused($focused, equals: .name)
//            }
//            Section(header: Text("Price")) {
//                TextField("Price", value: $toy.price, formatter: NumberFormatter.currencyFormatter)
//                                    .keyboardType(.decimalPad)
//                    .focused($focused, equals: .price)
//            }
//            Section(header: Text("Image url")) {
//                TextField("Image url", text: $toy.img_url)
//                    .focused($focused, equals: .img_url)
//            }
//            Section(header: Text("Info")) {
//                TextField("Info", text: $toy.info)
//                    .focused($focused, equals: .info)
//            }
//            Section {
//                Button(action: {
//                    //Verwijderen van toy aan API zodat het niet meer in de lijst staat
//                    //als je drukt op knop kom je weer op ToyView uit
//                }) {
//                    Text("Delete toy")
//                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
//                }
//            }
//        }
//        .onAppear {
//            if toy.name.isEmpty {
//                focused = .name
//            } else {
//                focused = .info
//            }
//        }
    }
}


#Preview {
    ToyDetailsView()
}

//struct ToyDetailsView_Previews: PreviewProvider {
//    struct Preview: View {
//        @State private var toy = Toy(from: "Preview" as! Decoder).toys.first!
//        var body: some View {
//            ToyDetailsView(toy: $toy)
//        }
//    }
//    
//    static var previews: some View {
//        Preview()
//    }
//}
