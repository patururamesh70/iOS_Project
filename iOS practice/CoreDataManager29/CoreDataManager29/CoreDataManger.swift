//
//  CoreDataManger.swift
//  CoreDataManager29
//
//  Created by patururamesh on 08/10/24.
//

import Foundation
import CoreData

class CoreDataManger {
    
    // MARK: - Core Data stack
    
    static let sharedCoreDataManager = CoreDataManger()
    
    lazy var context = persistentContainer.viewContext
    
    init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataManager29")
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

