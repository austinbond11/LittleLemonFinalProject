//
//  MenuItem.swift
//  LittleLemonApp
//
//  Created by Austin Bond on 28.06.2024.
//

import Foundation

// Struct to represent a menu item, conforms to Codable for JSON encoding/decoding and Identifiable for unique identification.
struct MenuItem: Codable, Identifiable {
    
    // Unique identifier for each menu item, defaults to a new UUID.
    var id = UUID()
    
    // Title of the menu item.
    let title: String
    
    // Description of the menu item.
    let descriptionDish: String
    
    // Price of the menu item as a string.
    let price: String
    
    // URL string for the image of the menu item.
    let image: String
    
    // Category to which the menu item belongs.
    let category: String
    
    // Enum to map the JSON keys to the corresponding struct properties.
    enum CodingKeys: String, CodingKey {
        // Coding key for the title property.
        case title = "title"
        // Coding key for the description property, maps to descriptionDish.
        case descriptionDish = "description"
        // Coding key for the price property.
        case price = "price"
        // Coding key for the image property.
        case image = "image"
        // Coding key for the category property.
        case category = "category"
    }
}
