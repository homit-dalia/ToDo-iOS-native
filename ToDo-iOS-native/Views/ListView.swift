//
//  ListView.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 07/03/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var showingAddView = false
    @State private var isAnimated = false
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        handleOnTapListItem(item: item)
                    }
                    .swipeActions(edge: .leading) {
                        Button("Completed") {
                            handleOnTapListItem(item: item)
                        }
                        .tint(Color.blue)
                    }
            }
            .onDelete(perform: listViewModel.delete)
            .onMove(perform: listViewModel.move)
        }
        .listStyle(.inset)
        .navigationTitle("To Do")
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add") {
                    showingAddView = true
                }
            }
        }
        .overlay {
            if listViewModel.items.isEmpty {
                VStack{
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Text("All Done!")
                        .font(.title)
                    Text("You have no pending tasks.")
                    Button("Add a Task") {
                        showingAddView = true
                    }
                    .font(.title3)
                    .foregroundColor(Color.white)
                    .frame(height: 50)
                    .frame(maxWidth: 200)
                    .background(isAnimated ? Color.red : Color.green)
                    .cornerRadius(10)
                    .padding(.top)
                }
                .padding(40)
            }
            
        }
        .onAppear(perform: {
            toggleAnimation()
        })
        .sheet(isPresented: $showingAddView) {
            AddView()
        }
    }
    
    func handleOnTapListItem(item: ItemModel) {
        withAnimation(Animation.easeInOut(duration: 1)) {
            listViewModel.toggleIsCompleted(item: item)
        }
    }
    
    func toggleAnimation(){
        withAnimation(Animation.spring(duration: 2).repeatForever()) {
            isAnimated.toggle()
        }
    }
}
