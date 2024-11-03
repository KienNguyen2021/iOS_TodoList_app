//
//  HeaderView.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-31.
//

import SwiftUI

struct HeaderView: View {
    
        
  // added more information for HeadView page :
        
        let title : String
        let subtitle : String
        let angle :  Double
        let background : Color
        
         var body: some View {
                  
                  ZStack {
                      
                      RoundedRectangle(cornerRadius:  0)
                          .foregroundColor(background)                 //(Color.pink)
                          .rotationEffect(Angle(degrees: angle))              //(degrees: 15))
        // -15 is opposite, to make color block horizontal degree of angle
                          
                      
                         VStack{
                               Text(title)                    // Text(" To Do List")
                              .font(.system(size: 50))
                              .foregroundColor(Color.white)
                              .bold()
                          
                          
                               Text(subtitle)                      //Text(" Get things done ")
                              .font(.system(size: 30))
                              .foregroundColor(Color.white )

                            }
                      .padding(.top, 80)    // Text 'Get things don' is 30 away from above Text
                      
                        }
                  .frame(width :UIScreen.main.bounds.width * 3, height:  350)
                  .offset(y : -150)
                 // .offset(x : 200)   // the color background is opposite side
                  
                 }
            }


#Preview {
    
  
        //HeaderView() -------> needed pass parameters now
        // Missing arguments for parameters 'title', 'subtitle', 'angle', 'background' in call
        
        HeaderView(title: "Title",
                   subtitle : "Subtitle",
                   angle: 15,
                   background: .blue)
        
    
}
