//
//  CoreDataManger.swift
//  CoreData3
//
//  Created by patururamesh on 17/09/24.
//

import Foundation
import CoreData

class CoreDataManger {
    
    // MARK: - Core Data stack
    static let shared: CoreDataManger = CoreDataManger()
    
    lazy var context = persistentContainer.viewContext
    
    private init() { }

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreData3")
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
    func fetch() -> [Student]{
        let fetchRequest = Student.fetchRequest()
        do {
            if let students = try context.fetch(fetchRequest) as?  [Student] {
                return students
            }
        } catch let error {
            return []
        }
    }
    func delete(student: Student) -> Bool {
        context.delete(student)
        saveContext()
        return true
    }
    func update(student: Student) -> Bool {
        return true
    }

}

