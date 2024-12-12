//
//  CoreDataManager.swift
//  CoreData9
//
//  Created by patururamesh on 23/09/24.
//

import Foundation
import CoreData

class CoreDataManager {
    // MARK: - Core Data stack
    
    static let shared: CoreDataManager = CoreDataManager()
    
    lazy var context = persistentContainer.viewContext
    
    private init() { }
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData9")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}



