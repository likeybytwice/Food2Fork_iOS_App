//
//  ViewController.swift
//  Food2Fork
//
//  Created by Mayla on 03/01/2019.
//  Copyright © 2019 Mayla. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    
    @IBAction func rightSwipe(_ sender: Any) {
        if RecipeManager.recipeInstance.currentRecipeNumber != 0 {
            RecipeManager.recipeInstance.currentRecipeNumber -= 1
            update()
        }
    }
    
    @IBAction func leftSwipe(_ sender: Any) {
        RecipeManager.recipeInstance.currentRecipeNumber += 1
        update()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //go back to first recipe
    override func viewWillAppear(_ animated: Bool) {
        RecipeManager.recipeInstance.reset()
        update()
    }
    
    func update(){
        if RecipeManager.recipeInstance.recipeCollection.count - 1 == (RecipeManager.recipeInstance.currentRecipeNumber ) || RecipeManager.recipeInstance.recipeCollection.count == 0 {
            RecipeManager.recipeInstance.getRecipe(){ status in
                if status {
                    let recipe = RecipeManager.recipeInstance.recipeCollection[RecipeManager.recipeInstance.currentRecipeNumber]
                    
                    self.recipeImage.downloaded(from: recipe.image_url)
                    self.recipeNameLabel.text = recipe.title
                    RecipeManager.recipeInstance.currentPageNumber += 1
                    
                }
                else{ }
            }
        }
        else {
            if RecipeManager.recipeInstance.recipeCollection.count - 1 >= RecipeManager.recipeInstance.currentRecipeNumber {
                let recipe = RecipeManager.recipeInstance.recipeCollection[RecipeManager.recipeInstance.currentRecipeNumber]
                
                self.recipeImage.downloaded(from: recipe.image_url)
                self.recipeNameLabel.text = recipe.title
            }
        }
    }
}

