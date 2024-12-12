//
//  EmployeeEntity+CoreDataProperties.swift
//  CRUD ApplicationTask
//
//  Created by patururamesh on 06/11/24.
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
    @NSManaged public var mobile: String?
    @NSManaged public var name: String?

}

extension EmployeeEntity : Identifiable {

}
