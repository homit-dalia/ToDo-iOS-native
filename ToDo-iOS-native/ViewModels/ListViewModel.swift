//
//  ListViewModel.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 10/03/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    // Initialize isFirstTimeUser based on the value stored in UserDefaults
    var isFirstTimeUser: Bool {
        didSet {
            saveFirstTimeUser()
        }
    }
    
    let itemsKey: String = "user-items-list"
    let isFirstTimeUserKey: String = "is-first-time-user"
    
    init() {
        // Initialize isFirstTimeUser based on the stored value in UserDefaults
        self.isFirstTimeUser = UserDefaults.standard.bool(forKey: isFirstTimeUserKey)
        initializeItems()
    }
    
    func initializeItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            // If there's no data in UserDefaults, populate items with default initial items
            let initialItems: [ItemModel] = [
                ItemModel(title: "Complete all assignments", isCompleted: false),
                ItemModel(title: "Go to the gym", isCompleted: false),
                ItemModel(title: "Call Counsellor", isCompleted: false),
                ItemModel(title: "Clean Fridge", isCompleted: false),
                ItemModel(title: "Take Bruno for a walk", isCompleted: true),
                ItemModel(title: "Attend 9pm Seminar", isCompleted: true)
            ]
            items = initialItems
            return
        }
        // If there's existing data, set items to the decoded data
        self.items = decodedData
    }

    
    func delete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func move(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func add(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func toggleIsCompleted(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.toggleIsCompleted()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
    
    func saveFirstTimeUser() {
        // Update the value in UserDefaults when isFirstTimeUser changes
        UserDefaults.standard.setValue(isFirstTimeUser, forKey: isFirstTimeUserKey)
    }
}
