//
//  Hero.swift
//  LittleLemonApp
//
//  Created by Austin Bond on 28.06.2024.
//

import SwiftUI

// The Hero view represents a prominent visual section, typically used for welcoming the user with a brief introduction.
struct Hero: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    // Restaurant Name
                    Text("Little Lemon")
                        .foregroundColor(Color.primaryColor2)
                        .font(.displayFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Restaurant Location
                    Text("Chicago")
                        .foregroundColor(.white)
                        .font(.subTitleFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Spacer to add some visual separation
                    Spacer(minLength: 5)
                    
                    // Restaurant Description
                    Text("""
                     We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                     """)
                    .foregroundColor(.white)
                    .font(.leadText())
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // Image representing the restaurant or a featured dish
                Image("hero-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 140)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
            }
        }
    }
}

// Preview provider for the SwiftUI preview canvas.
struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
            .padding()
            .background(Color.primaryColor1)   // Set background color
            .frame(maxWidth: .infinity, maxHeight: 240)  // Constraint frame size
    }
}
