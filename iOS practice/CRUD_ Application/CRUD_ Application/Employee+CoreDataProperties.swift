//
//  Employee+CoreDataProperties.swift
//  CRUD_ Application
//
//  Created by patururamesh on 07/11/24.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var mobile: String?
    @NSManaged public var dob: String?
    @NSManaged public var gender: String?
    @NSManaged public var companyname: String?
    @NSManaged public var desigination: String?
    @NSManaged public var yearsOfExperience: String?

}

extension Employee : Identifiable {

}
