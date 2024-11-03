//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-31.
//

import FirebaseFirestore
import Foundation

//ViewModel for list of items view
//Primary tab



class ToDoListViewViewModel : ObservableObject{
    
    @Published var showingNewItemView = false
    
    init(){}
    
    //after Delete Button background color is not Red :
    
    func delete(id: String){
        
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document("user_id")
            .collection("todos")
            .document(id)
            .delete()
        
    }
    
    
}
