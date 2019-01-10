//
//  Food2ForkAPI.swift
//  Food2Fork
//
//  Created by Mayla on 03/01/2019.
//  Copyright © 2019 Mayla. All rights reserved.
//

import Moya

enum Food2ForkAPI {
    case recipe(apiKey: String, sortLetter: String, page : Int?)
}

//MARK: Extensions
extension Food2ForkAPI: TargetType {
    var baseURL: URL {
        switch self {
        case.recipe:
            guard let url = URL(string: "https://www.food2fork.com/api/") else { fatalError("baseURL could not be configured.")}
            return url
        }
    }
    
    var path: String {
        switch self {
        case .recipe:
            return "search/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recipe:
            return .get
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case.recipe(let apiKey, let sortLetter, let pageNumber):
            return .requestParameters(parameters: ["key": apiKey, "sort": sortLetter, "page": pageNumber ?? 1], encoding: URLEncoding())
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}
