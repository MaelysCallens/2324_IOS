//
//  Toys.swift
//  Wishlist
//
//  Created by Maëlys Callens on 02/01/2024.
//

import Foundation

struct Toy: Codable, Identifiable {
    let id = UUID()
    var name: String
    var info: String
    var category: String
    var img_url: String
    var price: Double
    var user_id: String
    //var user_id =  "63fark5bc079877f4ec47bc9"
    var date_created: String
}

class Api : ObservableObject{
    @Published var toys = [Toy]()
    
    func loadData(completion:@escaping ([Toy]) -> ()) {
        guard let url = URL(string: "https://noams-toys-api-doc.cyclic.app/toys/price?min=0") else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let toys = try! JSONDecoder().decode([Toy].self, from: data!)
            print(toys)
            DispatchQueue.main.async {
                completion(toys)
            }
        }.resume()
        
    }
    
    func loadDataWithMaximumPrice(maxPrice: String, completion:@escaping ([Toy]) -> ()) {
        guard let url = URL(string: "https://noams-toys-api-doc.cyclic.app/toys/price?max=\(maxPrice)") else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let toys = try! JSONDecoder().decode([Toy].self, from: data!)
            print(toys)
            DispatchQueue.main.async {
                completion(toys)
            }
        }.resume()
    }
    
    func LoadDataOfSingleToy(id: String, completion:@escaping (Toy) -> ()) {
        guard let url = URL(string: "https://noams-toys-api-doc.cyclic.app/toys/singleToy/\(id)") else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let toy = try! JSONDecoder().decode(Toy.self, from: data!)
            print(toy)
            DispatchQueue.main.async {
                completion(toy)
            }
        }.resume()
    }
}
