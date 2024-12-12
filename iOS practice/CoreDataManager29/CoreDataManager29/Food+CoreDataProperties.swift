//
//  Food+CoreDataProperties.swift
//  CoreDataManager29
//
//  Created by patururamesh on 08/10/24.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var rice: String?
    @NSManaged public var white: String?

}

extension Food : Identifiable {

}
