//
//  Protocols.swift
//  ContactMe
//
//  Created by Varun Rathi on 07/12/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import CoreData
import Contacts

protocol ContactProtocol {
    
    func didFetchedContacts(contacts :[CNContact])
}



protocol Searchable {
    /// A list of strings that should be indexed.
    var searchableStrings: [String] { get }
    
    /// An NSURL that can uniquely identify this searchable object.
    var URIRepresentation: NSURL { get }
}


extension Searchable  where Self: NSManagedObject
{
    
    var URIRepresentation: NSURL {
     
        return objectID.uriRepresentation() as NSURL
    }
}
