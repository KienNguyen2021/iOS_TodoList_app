//
//  ContentView.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-30.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel  = MainViewViewModel()
    
    var body: some View {
        
        accountView
        
        // added NavigationView connected to LoginView page when open MainView :
       // NavigationView {
          //  LoginView()       // connected to LoginView
       
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{  // not empty, must enter something
// then, now added :
            
    
            // sign in
            //ToDoListView()   // call ToDoListView
            
            // now added :
            // TabView {
            //ToDoListView(), now pass parameter :
            
            //      ToDoListView(userId : viewModel.currentUserId)
            
            //      .tabItem {
            //             Label("Home", systemImage: "House") }
            
            
            //     ProfileView()
            //       .tabItem {
            //           Label("Profile ", systemImage: "person.circle")
            
            //       }
            //   }
            
        }
     else {
            LoginView()
            
                    }
        
               }
    
    // now created :
    
    
    @ViewBuilder
    
    var  accountView : some View{
        
        TabView {
            //ToDoListView(), now pass parameter :
            
            ToDoListView(userId : viewModel.currentUserId)
              
            .tabItem {
                    Label("Home", systemImage: "House")
                    
                }
            
          
            ProfileView()
                .tabItem {
                    Label("Profile ", systemImage: "person.circle")
                    
                }
            }
    
        }
    
        }
       

#Preview {
    MainView()
}
