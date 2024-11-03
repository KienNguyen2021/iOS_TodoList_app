//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-31.

// added FirebaseAuth to do authention :

import FirebaseAuth

import Foundation

// hold @State var.....changed to @public



class LoginViewViewModel :
    ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    // added a variable to show error message when login fail
    
    @Published var errorMessage = ""
    
    
    init(){}
    
    
    // func login(){
    
    //   errorMessage = ""     // to re-set, if email entered, error message is gone away
    
    //   guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
    //           !password.trimmingCharacters(in: .whitespaces).isEmpty
    
    //   else{
    //     errorMessage = " Please fill in all fields ! "
    
    //      return
    //    }
    
    // valid email is abc@gmai.com :
    
    //     guard email.contains("@") && email.contains(".")
    
    //     else{
    //      errorMessage = " Please enter valid email. "
    
    //        return
    //    }
    
    
    //     print("Called")
    // }
    
    //   func validate(){}
    //  }
    
    
    // Changed to  :
    
    func login(){
        
        guard validate() else {
            return
        }
   // try login with authentication by FireAuth:
        
        Auth.auth().signIn(withEmail: email, password: password)
        
       }
    
    
    
  //  private func validate () ---> changed to Bool : return True or False :
        
    private func validate () -> Bool {
        errorMessage = ""     // to re-set, if email entered, error message is gone away
       
 //make sure email, password are not empty, and valid email :
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
                
            else{
            errorMessage = " Please fill in all fields ! "
            
            return false
        }
        
        // valid email is abc@gmai.com :
        
        guard email.contains("@") && email.contains(".")
                
        else{
            errorMessage = " Please enter valid email. "
            
            return false
        }
        
        return true         // otherwise, return True
    }
    }
    
