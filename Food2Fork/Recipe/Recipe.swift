//
//  Recipe.swift
//  Food2Fork
//
//  Created by Mayla on 03/01/2019.
//  Copyright © 2019 Mayla. All rights reserved.
//

import Foundation
import Moya


final class Recipe {
    
    let publisher: String
    let social_rank: Double
    let f2f_url: String
    let publisher_url: String
    let title: String
    let source_url: String
    let recipe_id: String
    let image_url: String
    
    init(publisher: String, social_rank: Double, f2f_url: String, publisher_url: String, title: String, source_url: String, recipe_id: String, image_url: String){
        self.publisher = publisher
        self.social_rank = social_rank
        self.f2f_url = f2f_url
        self.publisher_url = publisher_url
        self.title = title
        self.source_url = source_url
        self.recipe_id = recipe_id
        self.image_url = image_url
    }
    
}

extension Recipe: Decodable {
    private enum ResultCodingKeys: String, CodingKey {
        
        case publisher
        case social_rank
        case f2f_url
        case publisher_url
        case title
        case source_url
        case recipe_id
        case image_url
        
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        
        let publisher =  try container.decode(String.self, forKey: .publisher)
        let social_rank =  try container.decode(Double.self, forKey: .social_rank)
        let f2f_url =  try container.decode(String.self, forKey: .f2f_url)
        let publisher_url =  try container.decode(String.self, forKey: .publisher_url)
        let title =  try container.decode(String.self, forKey: .title)
        let source_url =  try container.decode(String.self, forKey: .source_url)
        let recipe_id =  try container.decode(String.self, forKey: .recipe_id)
        let image_url =  try container.decode(String.self, forKey: .image_url)
        
        self.init(publisher: publisher, social_rank: social_rank, f2f_url: f2f_url, publisher_url: publisher_url, title: title, source_url: source_url, recipe_id: recipe_id, image_url: image_url)
        
    }
}

struct Result : Decodable {
    let count: Int
    let recipes: [Recipe]
    
    init(count : Int, recipes : [Recipe]){
        self.count = count
        self.recipes = recipes
    }
    
}
