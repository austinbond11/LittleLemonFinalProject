//
//  FoodItem.swift
//  LittleLemonApp
//
//  Created by Austin Bond on 28.06.2024.
//

import SwiftUI

// The FoodItem view represents a visual component displaying information about a specific dish.
struct FoodItem: View {
    
    // Model representing the dish to be displayed.
    let dish: Dish
    
    var body: some View {
        HStack {
            // VStack to stack text elements vertically.
            VStack {
                // Dish title
                Text(dish.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.sectionCategories())
                    .foregroundColor(.black)
                
                Spacer(minLength: 10)
                
                // Dish description
                Text(dish.descriptionDish ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.paragraphText())
                    .foregroundColor(.primaryColor1)
                    .lineLimit(2)
                
                Spacer(minLength: 5)
                
                // Dish price
                Text("$" + (dish.price ?? ""))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.highlightText())
                    .foregroundColor(.primaryColor1)
                    .monospaced()
            }
            
            // Asynchronously loads and displays the image for the dish.
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
        }
        .padding(.vertical)  // Adds vertical padding.
        .frame(maxHeight: 150)  // Sets a maximum height for the HStack.
    }
}

// Preview provider for the SwiftUI preview canvas.
struct FoodItem_Previews: PreviewProvider {
    static var previews: some View {
        FoodItem(dish: PersistenceController.oneDish())
    }
}
