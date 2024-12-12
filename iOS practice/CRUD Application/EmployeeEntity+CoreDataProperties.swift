//
//  EmployeeEntity+CoreDataProperties.swift
//  CRUD Application
//
//  Created by patururamesh on 07/11/24.
//
//

import Foundation
import CoreData


extension EmployeeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeEntity> {
        return NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
    }

    @NSManaged public var email: String?
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?

}

extension EmployeeEntity : Identifiable {

}
