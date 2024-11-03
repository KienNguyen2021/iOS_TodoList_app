//
//  RegisterView.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-30.
//

import SwiftUI


    
 // now deleted this variables :
     
   // @State var name =  " "   ---------> moved to ViewModel
   // @State var email =  " "---------> moved to ViewModel
   // @State var password =  " "---------> moved to ViewModel
    
//now added @State in struct :
    
    struct RegisterView: View {
        @StateObject var viewModel = RegisterViewViewModel()
    

        var body: some View {
        
  //added VStack cover HeaderView :
        
            VStack {
            //Header  :
            //    HeaderView()     // connected to HeadView
            
                HeaderView(title: "Register",
                       subtitle : "Start organizing todos",
                       angle: -15,         // changed from 15
                       background: .orange)
            
  // now create a registration form :
            
            Form{
                
                TextField("Full name ", text: $viewModel.name)   //$name------> viewModel.name
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address ", text: $viewModel.email) //$email------> viewModel.email
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)   // no Upper case letter
                 
                
                SecureField("Password ",text: $viewModel.password)  //$password------> viewModel.password
                    .textFieldStyle(DefaultTextFieldStyle())
                
// now added TLButton :
                
                TLButton( title :" Create Account", background: .green){   // or : blue, action:()->void)
                     //Attemp registration
                     
                          viewModel.register()
                       }
                    .padding()
                            
                //added now :
                
                }    // Form is done here
            
            .offset(y : -50)     // to move the Form box up
            
  // now addded Spacer, moving the background to the screen head :
            
            Spacer()
            
            }
            
    }
}

#Preview {
    RegisterView()
}
