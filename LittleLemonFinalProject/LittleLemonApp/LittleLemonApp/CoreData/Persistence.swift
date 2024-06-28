import CoreData
import Foundation

// Singleton class to handle Core Data stack initialization and operations.
struct PersistenceController {
    
    // Shared instance of the PersistenceController
    static let shared = PersistenceController()

    // Core Data persistent container for managing the Core Data stack.
    let container: NSPersistentContainer

    // Initializer to set up the persistent container.
    init() {
        // Initializing the persistent container with the provided database name.
        container = NSPersistentContainer(name: "ExampleDatabase")
        
        // Setting a URL for the persistent store description to a temporary location.
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        
        // Loading the persistent stores, handles initialization of the Core Data stack.
        container.loadPersistentStores(completionHandler: { _, _ in })
        
        // Ensures that the context will automatically merge changes from the parent context.
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // Method to clear all entries of "Dish" entity from the Core Data store.
    func clear() {
        // Creating a fetch request for the "Dish" entity.
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dish")
        
        // Creating a batch delete request for the "Dish" entities fetched by the fetch request.
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        // Executing the batch delete request using the persistent store coordinator and view context.
        let _ = try? container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
    }
    
    // Static method to create and return a sample "Dish" object.
    static func oneDish() -> Dish {
        // Creating a new "Dish" object in the view context.
        let dish = Dish(context: shared.container.viewContext)
        
        // Setting properties for the "Dish" object.
        dish.title = "Greek Salad"
        dish.descriptionDish = "The famous greek salad of crispy lettuce, peppers, olives, our Chicago."
        dish.price = "10"
        dish.category = "starters"
        dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
        
        // Returning the created "Dish" object.
        return dish
    }
}
