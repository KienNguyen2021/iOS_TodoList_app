//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-11-03.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    let item : ToDoListItem
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        //HStack : Horizontal Stack, VStack : Verticle stack :
        
        HStack{
            // Vertical stack :
            VStack (alignment: .leading){
            
            
                Text(item.title)
                    .font(.title)
                    // .bold()
                //Text(item.dueDate)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                   // .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .font(.footnote)
                    // .foregroundColor(Color.grey)
                    .foregroundColor(Color(.secondaryLabel))   // a light color label
            }
            
            Spacer()
            
 // on right hand side :
            
            Button{
                
                viewModel.toggleIsDone(item : item)   // check or uncheck box
                
            }label: {
                                  // if item is done image is circle checkmark, otherwise, circle normal :
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ToDoListItemView(
        
        item: .init(id :"123",
                    title: " Get milk",
                    dueDate: Date().timeIntervalSince1970,
                    createdDate:
                        Date()
            .timeIntervalSince1970,
                    
                    isDone: false))
    
    
    

}

