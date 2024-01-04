//
//  Toys.swift
//  Wishlist
//
//  Created by Maëlys Callens on 02/01/2024.
//

import Foundation

//SOURCE: https://medium.com/@adrian.creteanu/link-your-xcode-project-with-github-5d1aeb582b08

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
    
    func loadDataWithName(name: String, completion:@escaping ([Toy]) -> ()) {
        guard let url = URL(string: "https://noams-toys-api-doc.cyclic.app/toys/search?s=groot\(name)") else {
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
    
    //https://stackoverflow.com/questions/49683960/http-request-delete-and-put
    func DeleteToy(id: String, completion:@escaping (Bool) -> ()) {
        guard let url = URL(string: "https://noams-toys-api-doc.cyclic.app/toys/\(id)") else {
            print("Invalid url...")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                // als statuscode = 200 => toy is succesvol verwijderd
                DispatchQueue.main.async {
                    completion(true)
                }
            } else {
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }.resume()
    }
    
    func CreateToy(completion:@escaping (Toy) -> ()) {
        guard let url = URL(string: "https://noams-toys-api-doc.cyclic.app/toys") else {
            print("Invalid url...")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            let toy = try! JSONDecoder().decode(Toy.self, from: data!)
//            print(toy)
//            DispatchQueue.main.async {
//                completion(toy)
//            }
//        }.resume()
    }
}
