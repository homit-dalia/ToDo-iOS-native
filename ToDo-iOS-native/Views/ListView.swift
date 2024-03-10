//
//  ListView.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 07/03/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        handleOnTapListItem(item: item)
                    }
            }
            .onDelete(perform: listViewModel.delete)
            .onMove(perform: listViewModel.move)
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
    
    func handleOnTapListItem(item: ItemModel) {
        withAnimation(.bouncy()) {
            listViewModel.toggleIsCompleted(item: item)
        }
    }
    
}

#Preview {
    ListView()
}
