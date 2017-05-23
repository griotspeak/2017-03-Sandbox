//
//  fetchingExampleSnippet.swift
//  
//
//  Created by TJ Usiyan on 2017/05/18.
//
//

import CoreData


let managedObjectContext: NSManagedObjectContext /* = … */

var request = NSFetchRequest(entityName: "User")

request.predicate = NSPredicate("postCount > 9000")
request.predicate = NSPredicate { (object, _) in // same, but using a closure
    object.postCount > 9000
}


request.sortDescriptors = [
    NSSortDescriptor(key: "familyName", ascending: true),
    NSSortDescriptor(key: "givenName", ascending: true),
    NSSortDescriptor(key: "displayName", ascending: true),
]
let users: [User] = try! managedObjectContext.executeFetchRequest(request)
