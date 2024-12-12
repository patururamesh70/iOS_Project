//
//  CoreDataManager.swift
//  CRUD Application
//
//  Created by patururamesh on 06/11/24.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "CRUD_Application")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data stack: \(error)")
            }
        }
    }

    // Save Employee
    func saveEmployee(name: String, email: String, phone: String, gender: String) {
        let context = persistentContainer.viewContext
        let employee = EmployeeEntity(context: context)
        employee.name = name
        employee.email = email
        employee.phone = phone
        employee.gender = gender
        do {
            try context.save()
        } catch {
            print("Failed to save employee: \(error)")
        }
    }

    // Fetch all Employees
    func fetchEmployees() -> [EmployeeEntity] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<EmployeeEntity> = EmployeeEntity.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch employees: \(error)")
            return []
        }
    }

    // Delete Employee
    func deleteEmployee(employee: EmployeeEntity) {
        let context = persistentContainer.viewContext
        context.delete(employee)
        do {
            try context.save()
        } catch {
            print("Failed to delete employee: \(error)")
        }
    }
}
