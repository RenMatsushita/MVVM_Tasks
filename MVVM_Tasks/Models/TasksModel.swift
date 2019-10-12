//
//  TasksModel.swift
//  MVVM_Tasks
//
//  Created by Ren Matsushita on 2019/10/10.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation

class TodoModel {
    
    private let userDefaults = UserDefaults.standard
    
    func getTasks() -> [String]? {
        guard let tasks: [String] = self.userDefaults.array(forKey: "tasks") as? [String] else { return nil }
        return tasks
    }
    
    func setTask(taskTitle newTaskTitle: String) {
        var taskTitleList: [String] = []
        if let tasks: [String] = self.getTasks() {
            taskTitleList = tasks
        }
        
        taskTitleList.append(newTaskTitle)
        self.userDefaults.set(taskTitleList, forKey: "tasks")
    }
    
    func deleteTask(index: Int) {
        guard var taskTitleList: [String] = self.getTasks() else { return }
        taskTitleList.remove(at: index)
        self.userDefaults.set(taskTitleList, forKey: "tasks")
    }
}
