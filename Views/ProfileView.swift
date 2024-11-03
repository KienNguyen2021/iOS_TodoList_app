//
//  ProfileView.swift
//  ToDoList
//
//  Created by Kien Nguyen on 2024-10-30.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        //  Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        NavigationView{
            
            VStack {
                        
                    }
            .navigationTitle("Profile ")
        }
           
    }
}

#Preview {
    ProfileView()
}
