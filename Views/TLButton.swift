//
//  TLButton.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-31.
//

import SwiftUI

struct TLButton: View {
     
    let title : String
    let background : Color
    
    let action : () ->Void
    
    
    var body: some View {
        Button{
                action()
                }
                label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(background)
                                   
                            Text(title)
                                .foregroundColor(Color.white)
                                .bold()
                                   
                               }
                        }
                  .padding()    // now added
           }
           }

#Preview {
    TLButton(title : "Value", background: .pink) {     // or blue, action:()->void)
          //Action
    }
    
   }

