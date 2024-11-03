//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-30.
//

//import Firebase

import FirebaseCore

import SwiftUI

@main

     struct ToDoListApp: App {
    
          init(){
        
            FirebaseApp.configure()
              
              
              
          }
    
    var body: some Scene {
        WindowGroup {
           
            MainView()
            
        }
    }
}

//@main
//struct FireStoreDemoApp: App {

 //   init() {
   //     FirebaseApp.configure()
  //      makeReservation()
   // }

   // func makeReservation() {
     //   let db = Firestore.firestore()
        // Add the necessary Firebase instructions to create the reservation record.
    //}

    //var body: some Scene {
      //  WindowGroup {
        //      ContentView()
       // }
    //}
//}
