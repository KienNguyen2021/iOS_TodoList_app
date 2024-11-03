//
//  Extentions.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-11-01.
//

import Foundation

// when get data from User, this converts into JSON format :

    extension Encodable{
    
            func asDictionay () ->[String : Any]{
        
                guard let data = try? JSONEncoder().encode(self) else{
            
                    return [:]      // if fail, return empty dictionary
             }
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
                    
                    return json ?? [:]      // return json, otherwise, return empty dictionay
                }
                
                catch {
                    
                    return [:]      // if fail, return empty dictionary
                }
        
        
    }
}
