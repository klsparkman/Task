//
//  TaskController.swift
//  Task
//
//  Created by Kelsey Sparkman on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//
import Foundation
import CoreData

class TaskController {
    
    //Shared Instance
    static let sharedInstance = TaskController()
    
    //Source of Truth
    var fetchedResultsController: NSFetchedResultsController<Task>
    
    init() {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "isComplete", ascending: true)]
        let resultscontroller: NSFetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.contextMOC, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController = resultscontroller
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error performing the fetch. \(error.localizedDescription)\(#function)")
        }
    }
    
    // Mark: - CRUD
    func add(taskWithName name: String, notes: String?, due: Date?) {
        Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    func remove(task: Task) {
        CoreDataStack.contextMOC.delete(task)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.contextMOC.save()
        } catch {
            print("There was an error saving the data \(#function) \(error.localizedDescription)")
        }
    }
}//End of Class
