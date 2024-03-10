//
//  AddView.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 07/03/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var newTask: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            TextField("Enter Task Description...", text: $newTask)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color.gray)
                .cornerRadius(8)
            Button(
                action:addItem,
                label: {
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
    
    func addItem(){
        listViewModel.add(title: newTask)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddView()
}
