//
//  MainScreen.swift
//  LittleLemonApp
//
//  Created by Austin Bond on 28.06.2024.
//

import SwiftUI

// The MainScreen view serves as the primary interface for the app, combining the Header and Menu views.
struct MainScreen: View {
    // Access the managed object context from the environment.
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        // NavigationStack provides a navigation context for managing view transitions.
        NavigationStack {
            VStack {
                // Header section displaying the logo and profile button if logged in.
                Header()
                
                // Main menu displaying categories and list of dishes.
                Menu()
            }
        }
    }
}

// Preview provider for the SwiftUI preview canvas.
struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        // Provide an environment managed object context.
        MainScreen()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
