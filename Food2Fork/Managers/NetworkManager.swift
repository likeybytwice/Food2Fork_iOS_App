//
//  NetworkManager.swift
//  Food2Fork
//
//  Created by Mayla on 05/01/2019.
//  Copyright © 2019 Mayla. All rights reserved.
//

import Moya

final class NetworkManager {
    
    static let networkInstance = NetworkManager()
    let provider = MoyaProvider<Food2ForkAPI>()
    
    func getRecipe(target: Food2ForkAPI, completion: @escaping (Result?, Error?)->()) {
        
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                do {
                    let results: Result = try JSONDecoder().decode(Result.self, from: response.data)
                    completion(results, nil)
                    
                } catch let error {
                    print(error)
                    completion(nil, error)
                    
                } case .failure(let error):
                do {
                    completion(nil, error)
                }
            }
        }
    }
}
