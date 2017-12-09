//
//  Contact.swift
//  ContactMe
//
//  Created by Varun Rathi on 07/12/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import CoreData

class ContactModel1: NSManagedObject {
         @NSManaged var name1: String!
         @NSManaged var organization1: String?
}


extension ContactModel : Searchable {
    
    
    var searchableStrings:[String] {
        
        return [name1,organization1].flatMap({
            $0
        })
    }
}
