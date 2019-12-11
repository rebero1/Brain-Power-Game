//
 
//  Project 3
//
//  Created by Rebero Prince on 12/3/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//

//
//   Item+CoreDataClass.swift
//
//
//  Created by: CSC214 Instructor on 10/24/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//
//


import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    
    override public func awakeFromInsert() {
        if self.uuid == nil {
            self.uuid = UUID()
        }
    }
}
