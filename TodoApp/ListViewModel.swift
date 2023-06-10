//
//  ListViewModel.swift
//  TodoApp
//
//  Created by Lucas Pereira on 10/06/23.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveTasks()
        }
    }
    
    let tasksKey: String = "tasks_list"
    
    init() {
        getTasks()
    }
    
    func addTask(title: String) {
        let newTask = TaskModel(title: title, isCompleted: false)
        tasks.append(newTask)
    }
    
    func update(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task.updateCompleted()
        }
    }
    
    func delete(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func getTasks() {
        guard let data = UserDefaults.standard.data(forKey: tasksKey) else {
            return
        }
        guard let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data) else {
            return
        }
        self.tasks = savedTasks
    }
    
    func saveTasks() {
        if let encodeData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodeData, forKey: tasksKey)
        }
    }
}
