//
//  ListView.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 07/03/24.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "Complete all assignments",isCompleted: false),
        ItemModel(title: "Go to the gym",isCompleted: false),
        ItemModel(title: "Call Counsellor",isCompleted: false),
        ItemModel(title: "Clean Fridge",isCompleted: false),
        ItemModel(title: "Take Bruno for a walk",isCompleted: true),
        ItemModel(title: "Attend 9pm Seminar", isCompleted: true),
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(.inset)
        .navigationTitle("To Do")
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
}

#Preview {
    ListView()
}
