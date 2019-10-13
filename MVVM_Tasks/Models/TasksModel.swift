//
//  TasksModel.swift
//  MVVM_Tasks
//
//  Created by Ren Matsushita on 2019/10/10.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation

protocol TodoModelProtocol {
    func getTasks() -> [String]
    func setTask(taskTitle newTaskTitle: String)
    func deleteTask(index: Int)
}

class TodoModel: TodoModelProtocol {
    
    private let userDefaults = UserDefaults.standard
    
    func getTasks() -> [String] {
        guard let tasks = self.userDefaults.array(forKey: "tasks") as? [String] else {
            return []
        }
        return tasks
    }
    
    func setTask(taskTitle newTaskTitle: String) {
        var taskTitleList: [String] = []
        taskTitleList = self.getTasks()
        
        taskTitleList.append(newTaskTitle)
        self.userDefaults.set(taskTitleList, forKey: "tasks")
    }
    
    func deleteTask(index: Int) {
        var taskTitleList = self.getTasks()
        guard !taskTitleList.isEmpty else {
            return
        }
        taskTitleList.remove(at: index)
        self.userDefaults.set(taskTitleList, forKey: "tasks")
    }
}
