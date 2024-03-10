//
//  ListViewModel.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 10/03/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init(){
        initializeItems()
    }
    
    func initializeItems(){
        let initialItems: [ItemModel] = [
            ItemModel(title: "Complete all assignments",isCompleted: false),
            ItemModel(title: "Go to the gym",isCompleted: false),
            ItemModel(title: "Call Counsellor",isCompleted: false),
            ItemModel(title: "Clean Fridge",isCompleted: false),
            ItemModel(title: "Take Bruno for a walk",isCompleted: true),
            ItemModel(title: "Attend 9pm Seminar", isCompleted: true),
        ]
        items.append(contentsOf: initialItems)
    }
    
    func delete(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func move(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func add(title: String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func toggleIsCompleted(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.toggleIsCompleted()
        }
    }
}
