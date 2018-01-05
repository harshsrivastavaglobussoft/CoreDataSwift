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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func addTask(name: String,  code: Int32) {
        
        let user = RawAgent(context:context)
        user.agentname = name
        user.code = code
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    func fetchAndPrint() {
        let fetchRequest = NSFetchRequest<RawAgent>(entityName: "RawAgent")
        do {
            let fetchedResults = try context.fetch(fetchRequest)
            for item in fetchedResults {
                print(item.value(forKey: "agentname")!)
                print(item.value(forKey: "code")!)
            }
        } catch let error as NSError {
            // something went wrong, print the error.
            print(error.description)
        }
    }
}
