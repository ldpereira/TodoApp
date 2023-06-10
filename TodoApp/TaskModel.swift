//
//  TaskModel.swift
//  TodoApp
//
//  Created by Lucas Pereira on 10/06/23.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    let title: String
    let isCompleted: Bool
    let id: String
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompleted() -> TaskModel {
        return TaskModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
