//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-31.
//

import Foundation

// create an object :

struct ToDoListItem: Codable, Identifiable{
    
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone  : Bool        // to modify item is updated or done before click Save to update in database
    
    
    
    mutating func setDone(_ state: Bool){
        
        isDone = state    // to check or uncheck if item is done
    }
}
