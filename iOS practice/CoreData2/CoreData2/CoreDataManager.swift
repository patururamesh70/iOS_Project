//
//  CoreDataManager.swift
//  CoreData2
//
//  Created by patururamesh on 16/09/24.
//

import Foundation
import CoreData

class CoreDataManager {
    
    // MARK: - Core Data stack
    static let shared: CoreDataManager = CoreDataManager()
    
    lazy var context = persistentContainer.viewContext
    
    private init(){ }

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreData2")
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
    func fetch() -> [Car] {
        let fetchRequest = Car.fetchRequest()
        do {
            if let cars = try context.fetch(fetchRequest) as? [Car] {
                return cars
            }
        }catch let error {
                return []
            }
    }
    func delete(car: Car) -> Bool {
        context.delete(car)
        saveContext()
        return true
    }
    func update(car: Car) -> Bool {
        return true
    }
}


