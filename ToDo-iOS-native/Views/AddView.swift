//
//  AddView.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 07/03/24.
//

import SwiftUI

struct AddView: View {
        
    @State var newTask: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            TextField("Enter Task Description...", text: $newTask)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color.gray)
                .cornerRadius(8)
            Button(action: {}, label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .padding(.top)
            })
            Spacer()
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Add Task")
    }
}

#Preview {
    AddView()
}
