//
//  RecipeManager.swift
//  Food2Fork
//
//  Created by Mayla on 08/01/2019.
//  Copyright © 2019 Mayla. All rights reserved.
//

import Foundation


final class RecipeManager{
    
    var recipeCollection = [Recipe]()
    static let recipeInstance = RecipeManager()
    static let apiKey = "37a938e691ae51c89603bd7983d66093"
    static let sortLetter = "r"
    var currentPageNumber = 1
    var currentRecipeNumber = 0
    
    func getRecipe(completion: @escaping (Bool)->()){
        NetworkManager.networkInstance.getRecipe(target: .recipe(apiKey: RecipeManager.apiKey, sortLetter: RecipeManager.sortLetter, page: RecipeManager.recipeInstance.currentPageNumber)) { result, error in
            if result != nil {
                if result?.recipes != nil {
                    if RecipeManager.recipeInstance.currentPageNumber == 1 {
                        RecipeManager.recipeInstance.recipeCollection = (result?.recipes)!
                    } else {
                        RecipeManager.recipeInstance.recipeCollection += (result?.recipes)!
                    }
                }
                completion(true)
            } else{
                print(error!)
                completion(false)
            }
        }
    }
    
    func reset(){
        RecipeManager.recipeInstance.currentPageNumber = 1
        currentRecipeNumber = 0
    }
}
