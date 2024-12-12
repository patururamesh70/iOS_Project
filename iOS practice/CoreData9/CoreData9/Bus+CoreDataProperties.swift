//
//  Bus+CoreDataProperties.swift
//  CoreData9
//
//  Created by patururamesh on 23/09/24.
//
//

import Foundation
import CoreData


extension Bus {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bus> {
        return NSFetchRequest<Bus>(entityName: "Bus")
    }

    @NSManaged public var busnumber: String?
    @NSManaged public var busname: String?

}

extension Bus : Identifiable {

}
