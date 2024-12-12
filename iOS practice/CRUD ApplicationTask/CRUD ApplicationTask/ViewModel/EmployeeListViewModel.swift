//
//  EmployeeListViewModel.swift
//  CRUD ApplicationTask
//
//  Created by patururamesh on 06/11/24.
//

import Foundation

class EmployeeListViewModel {
    private var employees = [EmployeeEntity]()
    var didUpdateEmployees: (() -> Void)?
    
    func fetchEmployees() {
        // Fetch employees from Core Data first
        employees = CoreDataManager.shared.fetchEmployees()
        
        // If online, also fetch from API and update Core Data
        NetworkManager.shared.fetchEmployees { [weak self] result in
            switch result {
            case .success(let fetchedEmployees):
                // Sync Core Data with fetched data if necessary
                self?.syncWithCoreData(fetchedEmployees)
                self?.employees = CoreDataManager.shared.fetchEmployees()
                self?.didUpdateEmployees?()
                
            case .failure(let error):
                print("Failed to fetch employees: \(error)")
            }
        }
    }
    
    func syncWithCoreData(_ fetchedEmployees: [Employee]) {
        for employee in fetchedEmployees {
            // Check if employee exists locally, if not add it
            let existingEmployee = employees.first { $0.email == employee.email }
            if existingEmployee == nil {
                CoreDataManager.shared.addEmployee(name: employee.name, email: employee.email, mobile: employee.mobile, gender: employee.gender)
            }
        }
    }
    
    func numberOfEmployees() -> Int {
        return employees.count
    }
    
    func employee(at index: Int) -> EmployeeEntity {
        return employees[index]
    }
}
