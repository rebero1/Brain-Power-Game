//
//
//  Created by Rebero Prince on 12/3/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//

//
//   CoreDataStack.swift
//   MediaTracker
//
//  Created by: CSC214 Instructor on 10/24/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack: NSObject {
    
    static let shared = CoreDataStack()
    
    let modelName = "MediaTracker"
    
    lazy var context: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "MediaTracker")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var items: [NSManagedObject] = []

    // MARK: - Core Data operations
    
    func update() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Item")
        do {
            items = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch requested item. \(error), \(error.userInfo)")
        }
    }
    
    func saveItem(title: String, name: String, age: String, color: Int16, type: Int16, image: NSData  ) {
        
        if let entity = NSEntityDescription.entity(forEntityName: "Item", in: context) {
            let item = NSManagedObject(entity: entity, insertInto: context)
            item.setValue(title, forKeyPath: "title")
            item.setValue(name, forKeyPath: "artist")
            item.setValue(age, forKeyPath: "published")
            item.setValue(color, forKeyPath: "rating")
            item.setValue(type, forKeyPath: "type")
            item.setValue(image, forKey: "image")
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save the item. \(error), \(error.userInfo)")
            }
        }
        update()
    }

    func deleteItem(item: Item) {
        if let _ = items.firstIndex(of: item)  {
            context.delete(item)
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not delete the item. \(error), \(error.userInfo)")
            }
        }
        update()
    }

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

