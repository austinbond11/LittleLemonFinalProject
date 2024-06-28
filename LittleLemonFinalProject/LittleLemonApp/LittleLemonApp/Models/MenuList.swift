//
//  MenuList.swift
//  LittleLemonApp
//
//  Created by Austin Bond on 28.06.2024.
//

import Foundation
import CoreData

// A struct representing a list of menu items, conforming to Codable protocol.
struct MenuList: Codable {
    // The array of MenuItem objects.
    let menu: [MenuItem]
    
    // Coding keys to map JSON keys to the struct's property names.
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
    
    // Static function to fetch menu data from a remote source and update Core Data.
    static func getMenuData(viewContext: NSManagedObjectContext) {
        // Clear existing dishes from Core Data to avoid duplication.
        PersistenceController.shared.clear()
        
        // URL to the remote JSON file containing menu data.
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        
        // Create a URL request object.
        let request = URLRequest(url: url!)
        
        // Create a shared URLSession.
        let session = URLSession.shared
        
        // Create a data task to fetch the menu data.
        let dataTask = session.dataTask(with: request) { data, response, error in
            // Check if data was received.
            if let data = data {
                // Create a JSON decoder.
                let decoder = JSONDecoder()
                
                // Try to decode the data into a MenuList object.
                if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
                    // Iterate over each menu item.
                    for dish in fullMenu.menu {
                        // Create a new Dish object in the Core Data context.
                        let newDish = Dish(context: viewContext)
                        
                        // Set the attributes of the new Dish object.
                        newDish.title = dish.title
                        newDish.price = dish.price
                        newDish.descriptionDish = dish.descriptionDish
                        newDish.image = dish.image
                        newDish.category = dish.category
                    }
                    
                    // Save the context to persist the new dishes.
                    try? viewContext.save()
                
                // Handle decoding failure.
                } else {
                    print(error.debugDescription.description)
                }
            
            // Handle data fetch failure.
            } else {
                print(error.debugDescription.description)
            }
        }
        
        // Start the data task.
        dataTask.resume()
    }
}
