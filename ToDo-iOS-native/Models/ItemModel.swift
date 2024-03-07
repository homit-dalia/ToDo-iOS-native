//
//  ItemModel.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 08/03/24.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID().uuidString;
    let title: String;
    let isCompleted: Bool;
}
