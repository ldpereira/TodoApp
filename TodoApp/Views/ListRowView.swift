//
//  ListRowView.swift
//  TodoApp
//
//  Created by Lucas Pereira on 10/06/23.
//

import SwiftUI

struct ListRowView: View {
    
    let task: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? .green : .blue)
            Text(task.title)
                .foregroundColor(task.isCompleted ? .gray : .black)
                .fontWeight(task.isCompleted ? .thin : .regular)
                .font(.headline)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var task1 = TaskModel(title: "Item 1", isCompleted: true)
    static var task2 = TaskModel(title: "Item 2", isCompleted: false)
    static var previews: some View {
        Group {
            ListRowView(task: task1)
            ListRowView(task: task2)
        }.previewLayout(.sizeThatFits)
    }
}
