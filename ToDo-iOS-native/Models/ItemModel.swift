//
//  ItemModel.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 08/03/24.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String;
    let title: String;
    let isCompleted: Bool;
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toggleIsCompleted() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
