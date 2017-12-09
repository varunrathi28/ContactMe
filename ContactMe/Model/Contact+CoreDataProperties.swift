//
//  Contact+CoreDataProperties.swift
//  
//
//  Created by Varun Rathi on 09/12/17.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var organization: String?

}
