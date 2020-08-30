//
//  Api.swift
//  Nutritions
//
//  Created by Ramill Ibragimov on 30.08.2020.
//

import Foundation

class Api {
    
    func getPosts(username: String, password: String, searchItem: String, completion: @escaping (NutritionData) -> ()) {
        
        guard let url = URL(string: "https://\(username):\(password)@www.nutritics.com/api/v1.1/LIST/food=\(searchItem)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let response = try! JSONDecoder().decode(NutritionDataStatus.self, from: data)
            
            if response.status == 200 {
                let posts = try! JSONDecoder().decode(NutritionData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(posts)
                }
            }
            
            
            
        }.resume()
    }
}
