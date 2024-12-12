//
//  Car+CoreDataProperties.swift
//  CoreData2
//
//  Created by patururamesh on 16/09/24.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var brand: String?
    @NSManaged public var colour: String?

}

extension Car : Identifiable {

}
