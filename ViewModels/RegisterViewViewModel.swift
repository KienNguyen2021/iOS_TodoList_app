//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-31.
//

//added Firebase  :

import FirebaseFirestore

// added FirebaseAuth to do authention :

import FirebaseAuth

import Foundation

class RegisterViewViewModel : ObservableObject{
    
    
        @Published var name =  " "
        @Published var email =  " "
        @Published var password =  " "

    
     init (){}
    
     func register(){
        
           guard validate() else {
              return
            }
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self]result, error in guard let userId = result?.user.uid else{
                       return }
            
            self?.insertUserRecord(id : userId)
           }
         }
    
    private func insertUserRecord(id : String){
        
        // create object user input here :
        
               let newUser = User(id:id,
                                name :name,
                               email : email,
                               joined : Date().timeIntervalSince1970)
                           
              let db = Firestore.firestore()   // this stores user data in Server Firebase google
             db.collection("users")
                .document(id)
                .setData(newUser.asDictionay())     // data will be put in Firebase database
    }
    
    
    
    private func validate() -> Bool{
        
        
        //make sure name, password are not empty, and valid email :
        
                guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
                      !email.trimmingCharacters(in:.whitespaces).isEmpty,
                      !password.trimmingCharacters(in: .whitespaces).isEmpty
                
                      else{ return false }
        
        
            guard email.contains("@") && email.contains(".")
                
                     else{ return false }
// count the length of password at least 6 character :
        
            guard password.count >= 6
                
                    else{ return false }
        
//otherwise, return true :
        
           return true
        
    }
}
