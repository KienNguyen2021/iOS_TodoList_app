//
//  NewItemView.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-30.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    
    @Binding var newItemPresented : Bool     // to add data newItem into database
    
    
    var body: some View {
      //  Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
      VStack{
            
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
      
            
          Form{
              
              // Title :
              
              TextField("Title", text: $viewModel.title)
                  .textFieldStyle(DefaultTextFieldStyle())
              
              // Due date :
              
              DatePicker("Due Date", selection: $viewModel.dueDate)    // show date today
                  .datePickerStyle(GraphicalDatePickerStyle())       // show calender
              
              //Button
              
              TLButton(title: "Save", background: .pink){
                
                  // save new item right away :
                
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false      // new item gone away after click Save
                    } else {
                        
                        viewModel.showAlert = true
                    }
                  
              }
              .padding()  // moved Save button down
              
          }
          .alert(isPresented: $viewModel.showAlert) {
              Alert(
                title: Text("Error"),     // if not select new item, Alert is error pop-up
                message : Text("Please fill in all fields and select due date that is today or newer."))
          }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
        
    }, set: { _ in }    // do nothing
        
    ))
}
