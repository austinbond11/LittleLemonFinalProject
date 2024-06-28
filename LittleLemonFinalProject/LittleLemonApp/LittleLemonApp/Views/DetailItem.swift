//
//  DetailItem.swift
//  LittleLemonApp
//
//  Created by Austin Bond on 28.06.2024.
//

import SwiftUI

// The DetailItem view displays detailed information about a specific dish.
struct DetailItem: View {
    
    // Access the managed object context from the environment.
    @Environment(\.managedObjectContext) private var viewContext
    
    // Model representing the dish to be displayed.
    let dish: Dish
    
    var body: some View {
        ScrollView {
            // Asynchronously loads and displays the image for the dish.
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                // Displays a progress view while the image loads.
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            
            // Dish title
            Text(dish.title ?? "")
                .font(.subTitleFont())
                .foregroundColor(.primaryColor1)
            
            Spacer(minLength: 20)
            
            // Dish description
            Text(dish.descriptionDish ?? "")
                .font(.regularText())
            
            Spacer(minLength: 10)
            
            // Dish price
            Text("$" + (dish.price ?? ""))
                .font(.highlightText())
                .foregroundColor(.primaryColor1)
                .monospaced()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

// Preview provider for the SwiftUI preview canvas.
struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a sample dish for the preview.
        DetailItem(dish: PersistenceController.oneDish())
    }
}
