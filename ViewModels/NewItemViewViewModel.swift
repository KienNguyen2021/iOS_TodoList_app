//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-31.
//
// now import :
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel : ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    
    @Published var showAlert = false
    
    init (){}
    
    func save (){
        
        guard canSave else {
            return
        }
        
        // Get current user id :
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model:
        
        let newId = UUID().uuidString
        
        let newItem =  ToDoListItem(
            
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false     // by default, all items are not yet done
        
        )
        
        
        //Save model : to see these details on database
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionay())    // to convert new model above into Dictionary structure in database
    }
    
    var canSave : Bool{      // save new item into database
        
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            return false
        }
        
        // due date must be equal or greater than today - 86400 second:
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
             return false
        }
        return true
    }
}
