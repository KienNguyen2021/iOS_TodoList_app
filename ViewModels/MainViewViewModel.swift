//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-31.

// now added FirebaseAuth to authiticate Use sign in :

import FirebaseAuth


import Foundation

// connected to MainView in Views

class MainViewViewModel: ObservableObject{
    
    // when user sign in or sign out, this Publish will trigger :
    
    @Published var currentUserId : String = ""
    
    
    private var handler : AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{[weak self]_, user in
            
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                
            }
           }
    }
    
    public var isSignedIn : Bool{
        
        return Auth.auth().currentUser != nil
        
    }
}
