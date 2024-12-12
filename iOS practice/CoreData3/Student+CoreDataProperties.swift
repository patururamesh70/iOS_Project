//
//  Student+CoreDataProperties.swift
//  CoreData3
//
//  Created by patururamesh on 17/09/24.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var adress: String?

}

extension Student : Identifiable {

}
