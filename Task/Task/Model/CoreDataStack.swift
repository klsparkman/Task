//
//  CoreDataStack.swift
//  Task
//
//  Created by Kelsey Sparkman on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Task")
        container.loadPersistentStores() { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores \(error)")
            }
        }
        return container
    }()
    
    static var contextMOC: NSManagedObjectContext {
        return container.viewContext
    }    
}

