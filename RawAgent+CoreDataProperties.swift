//
//  RawAgent+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Sumit Ghosh on 05/01/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//
//

import Foundation
import CoreData


extension RawAgent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RawAgent> {
        return NSFetchRequest<RawAgent>(entityName: "RawAgent")
    }

    @NSManaged public var agentname: String?
    @NSManaged public var code: Int32
    
}
