//
//  Task+Convenience.swift
//  Task
//
//  Created by Kelsey Sparkman on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    @discardableResult

    convenience init(name: String, notes: String? = nil, due: Date? = nil, isComplete: Bool = false, moc: NSManagedObjectContext = CoreDataStack.contextMOC) {
        self.init(context: moc)
        self.name = name
        self.notes = notes
        self.due = due
    }
}
