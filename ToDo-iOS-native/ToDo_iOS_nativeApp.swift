//
//  ToDo_iOS_nativeApp.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 07/03/24.
//

import SwiftUI

@main
struct ToDo_iOS_nativeApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
