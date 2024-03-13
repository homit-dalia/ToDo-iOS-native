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
    @FocusState private var isFocused: Bool
    
    @State private var isAlertVisible: Bool = false
    @State var newTask: String = ""
    
    var body: some View {
        VStack{
            Text("Add a Task")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .frame(alignment: .center)
                .padding(.top)
            Spacer()
            TextField("Enter Task Description...", text: $newTask)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.systemBlue).opacity(0.2))
                .cornerRadius(8)
                .focused($isFocused)
                .onAppear {
                    isFocused = true
                }
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
        .alert("Task cannot be empty", isPresented: $isAlertVisible) {
                   Button("OK", role: .cancel) { }
               }
    }
    
    func addItem(){
        if newTask.isEmpty{
            isAlertVisible = true
            return
        }
        listViewModel.add(title: newTask)
        presentationMode.wrappedValue.dismiss()
    }
}


#Preview {
    AddView()
}
