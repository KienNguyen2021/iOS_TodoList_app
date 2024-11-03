//
//  User.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-31.
//

import Foundation


  // Codable is superhandy :

struct User : Codable {
    
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval     // when user sign up
}
