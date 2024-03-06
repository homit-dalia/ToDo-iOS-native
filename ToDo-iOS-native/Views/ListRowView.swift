//
//  ListRowView.swift
//  ToDo-iOS-native
//
//  Created by Homit Dalia on 07/03/24.
//

import SwiftUI

struct ListRowView: View {
    
    let iconName: String = "circle"
    let task: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
            Text(task)
                .padding(.leading, 10)
            Spacer()
        }
    }
}

#Preview {
    ListRowView(task: "Hello World")
}
