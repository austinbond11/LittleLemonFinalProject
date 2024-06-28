//
//  Home.swift
//  LittleLemonApp
//
//  Created by Austin Bond on 28.06.2024.
//

import SwiftUI

// The Home view serves as the landing page after the user logs in.
struct Home: View {
    
    var body: some View {
        // Display the main screen without showing the back button in the navigation bar.
        MainScreen()
            .navigationBarBackButtonHidden()
    }
}

// Preview provider for SwiftUI preview canvas.
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        // Provide an environment managed object context.
        Home()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
