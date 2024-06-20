//
//  NetworkClass.swift
//  Eurobank
//
//  Created by Vasileios Pigadas on 20/6/24.
//

import Foundation

class Network: ObservableObject {
    
    @Published var responseData: [JsonResponse] = []
    
    func get() {
        guard let url = URL(string: "https://petstore.swagger.io/v2/pet/findByStatus?status=available") else { fatalError("MissingURL") }
        
        let urlRequest = URLRequest(url: url)
        
        let request = URLSession.shared.dataTask(with: urlRequest) { (data, response,error) in
            if let httpError = error {
                print("Requst error:", httpError)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {return}
            
            if (response.statusCode == 200){
                guard let data = data else {return}
                
                DispatchQueue.main.async {
                    do {
                        self.responseData = try JSONDecoder().decode([JsonResponse].self, from: data) }
                    catch let error{
                        print("Error decoding...",error)
                    }
                }
            }
        }
        
        request.resume()
        
        
    }
}
