//
//  CoreDataManager.swift
//  CRUD ApplicationTask
//
//  Created by patururamesh on 06/11/24.
//

import Foundation
import CoreData

class CoreDataManager {

    static let shared = CoreDataManager()
    lazy var context = persistentContainer.viewContext
    
    private init() { }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CRUD Application") // Your .xcdatamodeld file name
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    // Save changes in the Core Data context
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    // CRUD operations
    func addEmployee(name: String, email: String, mobile: String, gender: String) {
        let employee = EmployeeEntity(context: context)
        employee.name = name
        employee.email = email
        employee.mobile = mobile
        employee.gender = gender
        saveContext()
    }
    
    func fetchEmployees() -> [EmployeeEntity] {
        let fetchRequest: NSFetchRequest<EmployeeEntity> = EmployeeEntity.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch employees: \(error)")
            return []
        }
    }
    
    func deleteEmployee(by email: String) {
        let fetchRequest: NSFetchRequest<EmployeeEntity> = EmployeeEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            if let employee = try context.fetch(fetchRequest).first {
                context.delete(employee)
                saveContext()
            }
        } catch {
            print("Failed to delete employee: \(error)")
        }
    }
    
    func updateEmployee(email: String, newName: String, newMobile: String, newGender: String) {
        let fetchRequest: NSFetchRequest<EmployeeEntity> = EmployeeEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            if let employee = try context.fetch(fetchRequest).first {
                employee.name = newName
                employee.mobile = newMobile
                employee.gender = newGender
                saveContext()
            }
        } catch {
            print("Failed to update employee: \(error)")
        }
    }
}
