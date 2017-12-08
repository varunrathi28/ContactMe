//
//  Contact.swift
//  ContactMe
//
//  Created by Varun Rathi on 07/12/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import CoreData

class Contact: NSManagedObject {
         @NSManaged var name: String!
         @NSManaged var firstName: String?
         @NSManaged var lastName: String?
         @NSManaged var organization: String?
}


extension Contact : Searchable {
    
    
    var searchableStrings:[String] {
        
        return [name,firstName,lastName,organization].flatMap({
            $0
        })
    }
}
