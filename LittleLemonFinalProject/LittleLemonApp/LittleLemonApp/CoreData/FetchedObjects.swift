import CoreData
import Foundation
import SwiftUI

// A generic SwiftUI view that fetches and displays Core Data objects.
struct FetchedObjects<T, Content>: View where T: NSManagedObject, Content: View {
    
    // Closure that defines the content to be displayed using the fetched objects.
    let content: ([T]) -> Content

    // Fetch request for the specified entity type.
    var request: FetchRequest<T>
    
    // Extracting the fetched results from the request.
    var results: FetchedResults<T> { request.wrappedValue }
    
    // Initializer to set up the fetch request and content closure.
    init(
        // Predicate to filter the fetched objects. Defaults to a true predicate, fetching all objects.
        predicate: NSPredicate = NSPredicate(value: true),
        // Sort descriptors to sort the fetched objects. Defaults to an empty array for no sorting.
        sortDescriptors: [NSSortDescriptor] = [],
        // Content closure to define the SwiftUI view using the fetched objects.
        @ViewBuilder content: @escaping ([T]) -> Content
    ) {
        self.content = content
        // Initialize the fetch request with the provided entity, sort descriptors, and predicate.
        self.request = FetchRequest(
            // Set entity type from the generic type T.
            entity: T.entity(),
            sortDescriptors: sortDescriptors,
            predicate: predicate
        )
    }
    
    // The body of the SwiftUI view that maps the fetched results to the content closure.
    var body: some View {
        self.content(results.map { $0 })
    }
}
