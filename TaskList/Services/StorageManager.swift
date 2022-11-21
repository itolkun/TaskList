//
//  StorageManager.swift
//  TaskList
//
//  Created by Айтолкун Анарбекова on 20/11/22.
//

import Foundation
import CoreData


class StorageManager {
    
    static let shared = StorageManager()
    
    private init() {}
    
    
 
    // MARK: - Core Data stack
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TaskList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    

    // MARK: - Core Data Saving support
    func saveContext() {
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
    
    func fetchTasks() -> [Task] {
        let fetchRequest = Task.fetchRequest()
        guard let taskList = try? persistentContainer.viewContext.fetch(fetchRequest) else { return [] }
        return taskList
    }
    
    func deleteTask(at task: Task) {
        persistentContainer.viewContext.delete(task)
        saveContext()
    }
    
    func updateTask(at task: Task) {
        persistentContainer.viewContext.
    }

}
