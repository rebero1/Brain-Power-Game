//

//

//
//   Item+CoreDataProperties.swift
// 
//
//  Created by: CSC214 Instructor on 10/24/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var artist: String?
    @NSManaged public var published: String?
    @NSManaged public var rating: Int16
    @NSManaged public var title: String?
    @NSManaged public var type: Int16
    @NSManaged public var uuid: UUID?
    @NSManaged public var image: NSData?

}
