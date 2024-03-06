//
//  ListView.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 07/03/24.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "Complete all assignments",
        "Go to the gym",
        "Call Counsellor",
        "Clean Fridge",
        "Take Bruno for a walk",
        "Attend 9pm Seminar"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(task: item)
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
