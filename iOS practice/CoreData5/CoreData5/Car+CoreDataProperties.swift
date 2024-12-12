//
//  Car+CoreDataProperties.swift
//  CoreData5
//
//  Created by patururamesh on 20/09/24.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var brand: String?
    @NSManaged public var color: String?

}

extension Car : Identifiable {

}
