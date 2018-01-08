//
//  CoreDatahelper.swift
//  CoreDataDemo
//
//  Created by Sumit Ghosh on 05/01/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataHelper {
    static let sharedInstance = CoreDataHelper()
    
    //Initialise the persistant container
    //Persistant container encapsulates the Core Data stack in the application
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Add Data to the entity *row data
    func addTask(name: String,  code: Int32) {
        
        let user = RawAgent(context:context)
        user.agentname = name
        user.code = code
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    //Fetch all the entity from the attribute
    func fetchAndPrint() -> Array<RawAgent>{
        let finalArray:NSMutableArray = NSMutableArray.init()
        let fetchRequest = NSFetchRequest<RawAgent>(entityName: "RawAgent")
        do {
            let fetchedResults = try context.fetch(fetchRequest)
            for item in fetchedResults {
                print(item.value(forKey: "agentname")!)
                print(item.value(forKey: "code")!)
                finalArray .add(item)
            }
            return finalArray as! Array<RawAgent>
        } catch let error as NSError {
            // something went wrong, print the error.
            print(error.description)
            return []
        }
    }
    
    //Delete a object from the attribute
    func deleteRecords(managedObject:RawAgent) -> Bool {
        context.delete(managedObject)
        do {
            try context.save()
            print("saved!")
            return true
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
            return false
        } catch {
            return false
        }
    }
    // Fetch an object according to ID
    func getById(id: NSManagedObjectID) -> RawAgent? {
        return context.object(with: id) as? RawAgent
    }
    //Update an object data 
    func updateRecord(managedObject:RawAgent,name:String)->Bool{
        if let Agent = getById(id: managedObject.objectID){
            Agent.agentname = name
        }
        do {
            try context.save()
            print("saved!")
            return true
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
            return false
        } catch {
            return false
        }
    }
}
