//
//  SearchIndex.swift
//  ContactMe
//
//  Created by Varun Rathi on 08/12/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import FMDB
import CoreData

class SearchIndex {
    let databaseQueue: FMDatabaseQueue
    
    init() {
        
        
        let path = FileManager.default.urls(for: .libraryDirectory
            , in: .userDomainMask)[0].appendingPathComponent("SearchIndex.sqlite").path
        
        databaseQueue = FMDatabaseQueue(path: path)
        databaseQueue.inTransaction { database, rollback in
            do {
                try database.executeUpdate("CREATE VIRTUAL TABLE IF NOT EXISTS documents USING fts4(tokenize=unicode61, identifier, contents);", values: [])
            } catch {
                print("Warning: Search Index create failed: \(error)")
            }
        }
    }
    
    
    func insertSearchable(object: Searchable) {
        databaseQueue.inDatabase { database in
            do {
                try database.executeUpdate("DELETE FROM documents WHERE identifier = ?;", values: [object.URIRepresentation.absoluteString])
                try database.executeUpdate("INSERT INTO documents (identifier, contents) VALUES(?, ?);", values: [object.URIRepresentation.absoluteString, object.searchableStrings.joined(separator: " ")])
            } catch {
                print("Warning: Search Index insert failed: \(error)")
            }
        }
    }
    
    func searchForURIsWithQuery(query: String) -> [NSURL] {
        var objects = [NSURL]()
        
        databaseQueue.inDatabase { database in
            let results: FMResultSet
            
            do {
                results = try database.executeQuery("SELECT identifier FROM documents WHERE contents MATCH ?;", values: [query])
            } catch {
                print("Warning: Search Index query failed: \(error)")
                return
            }
            
            while results.next() {
                objects.append(NSURL(string: results.string(forColumn: "identifier")!)!)
            }
        }
        
        return objects
    }
    
    func searchForManagedObjectsWithQuery(query: String, inManagedObjectContext managedObjectContext: NSManagedObjectContext) -> [NSManagedObject] {
        return searchForURIsWithQuery(query: query).flatMap { uri in
            if let objectID = managedObjectContext.persistentStoreCoordinator?.managedObjectID(forURIRepresentation: uri as URL) {
                return managedObjectContext.object(with: objectID)
            } else {
                return nil
            }
        }
    }
    
    
    
}

