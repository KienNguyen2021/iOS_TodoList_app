//
//  LoginView.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-30.
//

import SwiftUI

struct LoginView: View {
    
    //added new @ StateObject to relace :  @State var email = ""  @State var password = ""
    
    @StateObject var viewModel = LoginViewViewModel ()
    
    
    
    var body: some View {
        
        // added NavigationView, in order to be moved to another page after Click  :
        
        NavigationView{
            
            
                
            VStack {
                
                //Header  :
                
                //HeaderView()      // connected to HeaderView
                
                HeaderView(title: "To Do List",
                           subtitle : "Get things done ",
                           angle: 15,
                           background: .pink)
                
 
            
                //Login Form :
                Form {
//now added variable to show error message when login :
                    
                    if !viewModel.errorMessage.isEmpty    //if not empty
                     {
                        Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                    }
                    
                    
                    TextField("Email Address", text : $viewModel.email )    //$email
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                      
            
        //RoundedBorderTextFieldStyle() changed to DefaultTextFieldStyle
                    
                    //  TextField("Email Address", text : $passoword)
                                   // $password
                    SecureField("Password", text :$viewModel.password )   // SecureField is more secure
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
  // Button moved to TLButton :
                    
                    TLButton( title :"Log in", background: .blue) {  // or : blue, action:()->void)
                    
                        // now added viewModel.log
                        
                        viewModel.login()
                    
                      }
                    
                     .padding()
                    // select Button Action Label :
          //now Custom the button by opening another
                        
                      
                      }    // Form  done
                
                .offset(y: -50)   // move up the the email password Form up or down
                
                //Create Account :
                
                VStack {
                    
                    Text(" New around here ? ")
                        .padding(.top, 10)    // Text 'Create an Account' is 20 away from above Text
                    
                    // Button("Create An Account ") { }
                    
//added Navigation here, after click on Create an Account, moved to RegisterView page :
// used Destination connected to other Page :
                    NavigationLink("Create an Account", destination : RegisterView())
                    
            //.padding(.top, 10)    // Text 'Create an Account' is 20 away from above Text
                    
                    }
                
                     .padding(.bottom, 50 )
                
            
                Spacer()      // to make the block of color moved up to the top of screen    }
                
            }
            
            
            
        }
        
        
      }
   }

#Preview {
    LoginView()
}
