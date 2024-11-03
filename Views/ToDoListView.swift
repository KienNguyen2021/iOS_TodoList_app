//
//  ToDoListitemsView.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-30.
//

import FirebaseFirestoreSwift

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewViewModel ()
    
    @FirestoreQuery var items : [ToDoListItem]     // dictionary data stored
      
// now, added private let :
   // private let  userId : String
    
    //now added here :
    init (userId : String){
        self._items = FirestoreQuery(
         
            collectionPath : "users/\(userId)/todos"
        )
    }
    
    
    var body: some View {
        //Text("Welcome to your account ! ")
        // now added Navigation, connected to another page ProfileView :
        // do the same to ProfileView /Views page 
        NavigationView {
            
            VStack{
                
                List(items) {item in ToDoListItemView(item: item)
                 
                    //Text(item.title)
                        .swipeActions(){
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                                }
                            .tint(.red)  // swipe button, red to delete
                        
                //        label: {
                                Text("Delete")
                //                    //.foregroundColor(Color.red)
                                    .background(Color.red)
                //
  // delete Burrton is not red, open ToDoListViewViewModel in ViewModel
                            }
                        
                         }
                .listStyle(PlainListStyle())
                
                  }
            .navigationTitle(" To Do List")
            .toolbar{
                Button{
                    //Action
                    viewModel.showingNewItemView = true
                     } label: {
                    Image(systemName: "plus")     // add Icon + at top right corner
                    }
                  }
            
            
            .sheet(isPresented: $viewModel.showingNewItemView) {
                
                NewItemView(newItemPresented:
                                $viewModel.showingNewItemView)
            }
          }
        }
        
    }


#Preview {
    
 //now added parameter here, similer to above :
    ToDoListView(userId: "/users/9913YAuwJ9UAzoAorYYth4PxeRq2")
}
