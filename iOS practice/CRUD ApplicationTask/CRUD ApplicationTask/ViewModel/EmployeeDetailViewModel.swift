//
//  EmployeeDetailViewModel.swift
//  CRUD ApplicationTask
//
//  Created by patururamesh on 06/11/24.
//

import Foundation

class EmployeeDetailViewModel {
    var employee: EmployeeEntity

    init(employee: EmployeeEntity) {
        self.employee = employee
    }

    func deleteEmployee(completion: @escaping (Bool) -> Void) {
        NetworkManager.shared.deleteEmployee(email: employee.email ?? "") { result in
            switch result {
            case .success:
                CoreDataManager.shared.deleteEmployee(by: self.employee.email ?? "")
                completion(true)
            case .failure(let error):
                print("Failed to delete employee: \(error)")
                completion(false)
            }
        }
    }
}
extension EmployeeDetailViewModel {
    func updateEmployee(name: String, mobile: String, gender: String) {
        // Update in Core Data
        CoreDataManager.shared.updateEmployee(email: employee.email ?? "", newName: name, newMobile: mobile, newGender: gender)
        
        // Update on Server
        let updatedEmployee = Employee(name: name, email: employee.email ?? "", mobile: mobile, gender: gender)
        NetworkManager.shared.createOrUpdateEmployee(updatedEmployee) { result in
            switch result {
            case .success:
                print("Employee updated successfully on server")
            case .failure(let error):
                print("Failed to update employee: \(error)")
            }
        }
    }
}

